# Python Based Docker
#FROM python:latest
FROM python:3.9.7-slim-buster
# Installing Packages and Build Dependencies for pyarrow
RUN apt update && \
    apt upgrade -y && \
    apt install -y git curl ffmpeg aria2 \
    cmake build-essential libboost-dev \
    libarrow-dev libarrow-python-dev

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
