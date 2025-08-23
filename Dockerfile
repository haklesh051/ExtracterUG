# Python Based Docker
FROM python:3.9-slim-bookworm

# Installing Packages and Build Dependencies for pyarrow
RUN apt-get update && \
    apt-get install -y git curl ffmpeg aria2 \
    cmake build-essential libboost-dev \
    libarrow-dev libarrow-python-dev \
    && rm -rf /var/lib/apt/lists/*

# Updating Pip Packages
RUN pip install --upgrade pip

# Copying Requirements
COPY requirements.txt /requirements.txt

# Installing Requirements
RUN pip install --upgrade -r /requirements.txt

# Create working directory and copy script
RUN mkdir /EXTRACTOR
WORKDIR /EXTRACTOR
COPY start.sh /start.sh

# Running MessageSearchBot
CMD ["/bin/bash", "/start.sh"]
