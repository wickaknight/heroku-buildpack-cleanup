#!/bin/bash

echo "Starting post-build cleanup..."

# Clear unnecessary Python packages
echo "Clearing Python packages not used in the project..."
pip install pip-autoremove
pip-autoremove <package_name> -y

# Remove unused imports and variables from Python files
echo "Removing unused imports and variables..."
pip install autoflake
autoflake --in-place --remove-all-unused-imports --remove-unused-variables --recursive .

# Remove caches and temporary files
echo "Removing temporary files and caches..."
rm -rf ~/.cache/pip
rm -rf venv/
find . -name "*.pyc" -exec rm -f {} \;
find . -name "*.pyo" -exec rm -f {} \;

# Remove other unneeded directories (if present)
rm -rf tests/ docs/ examples/

echo "Post-build cleanup complete."
