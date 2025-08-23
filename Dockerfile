# Python 3.11 (safe for Pyrofork + modern libs)
FROM python:3.11-slim-bookworm

# Install system packages
RUN apt-get update && \
    apt-get install -y git curl ffmpeg aria2 \
    build-essential cmake libboost-dev \
    && rm -rf /var/lib/apt/lists/*

# Upgrade pip
RUN pip install --upgrade pip

# Copy requirements
COPY requirements.txt /requirements.txt

# Install requirements
RUN pip install --no-cache-dir -r /requirements.txt

# Create working directory
WORKDIR /app

# Copy all project files
COPY . .

# Make start.sh executable
RUN chmod +x /start.sh

# Run bot
CMD ["/bin/bash", "/start.sh"]
