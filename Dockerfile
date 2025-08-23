FROM python:3.9-slim-bookworm

# Install system dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    git curl ffmpeg aria2 \
    cmake build-essential libboost-dev \
    && rm -rf /var/lib/apt/lists/*

# Upgrade pip & install pyarrow
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir pyarrow

# Set working directory
WORKDIR /app

# Copy project files
COPY . .

# Install Python requirements
RUN pip install --no-cache-dir -r requirements.txt

# Run bot
CMD ["bash", "start.sh"]
