#!/bin/bash
set -e

echo "Installing requirements..."
pip install --no-cache-dir -r requirements.txt

echo "Starting Bot..."
python -m Extractor
# OR agar main.py se run karna ho:
# python main.py
