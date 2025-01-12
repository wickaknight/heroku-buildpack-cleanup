#!/bin/bash

echo "Starting post-build cleanup..."

# Clear unnecessary libraries
echo "Clearing Python packages not used in the project..."
pip freeze | grep -vE "Flask==3.1.0|Pillow==11.1.0|Requests==2.32.3|torch==2.1.0\+cpu|torchaudio==2.1.0\+cpu|transformers==4.47.1|TTS==0.22.0|gunicorn" | xargs pip uninstall -y

# Remove caches and temporary files
echo "Removing temporary files and caches..."
rm -rf ~/.cache/pip
rm -rf ~/.cache
rm -rf venv/
find . -name "*.pyc" -exec rm -f {} \;
find . -name "*.pyo" -exec rm -f {} \;

# Remove other unneeded directories (if present)
rm -rf tests/ docs/ examples/

echo "Cleanup completed."