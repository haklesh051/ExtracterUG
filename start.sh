#!/bin/bash
set -e

echo "Cloning Repo..."
git clone https://github.com/Popeye68/TXT-EXTRACTOR /app/TXT-EXTRACTOR

cd /app/TXT-EXTRACTOR

echo "Installing requirements..."
pip install --no-cache-dir -r requirements.txt

echo "Starting Bot..."
exec python .
