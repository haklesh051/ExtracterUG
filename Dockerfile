# Python Based Docker
FROM python:latest

# Installing Packages
RUN apt update && \
    apt upgrade -y && \
    apt install -y git curl ffmpeg aria2

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
