#!/bin/bash

echo "Cloning Repo..."
if [ ! -d "/app/TXT-EXTRACTOR" ]; then
  git clone https://github.com/Popeye68/TXT-EXTRACTOR /app/TXT-EXTRACTOR
fi

cd /app/TXT-EXTRACTOR || exit 1

echo "Installing requirements..."
pip install --no-cache-dir -r requirements.txt

echo "Starting Bot..."
python -m Extractor
