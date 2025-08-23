## Python Based Docker
FROM python:3.9-slim-bookworm

# System dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    git curl ffmpeg aria2 \
    cmake build-essential libboost-dev \
    && rm -rf /var/lib/apt/lists/*

# Upgrade pip & install pyarrow
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir pyarrow

# Copy requirements
COPY requirements.txt /requirements.txt

# Install other requirements
RUN pip install --no-cache-dir -r /requirements.txt

# Working dir
WORKDIR /EXTRACTOR
COPY start.sh /start.sh

CMD ["bash", "/start.sh"]
