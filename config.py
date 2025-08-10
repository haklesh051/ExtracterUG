import os
from os import getenv

API_ID = int(os.environ.get("API_ID", "21207277"))  # Replace "123456" with your actual api_id or use .env
API_HASH = os.environ.get("API_HASH", "f426a556fa99b7c9e6aa7d3928f151ef")
BOT_TOKEN = os.environ.get("BOT_TOKEN", "7674791964:AAGqJiEu8XcXdOZXDBw-Y4Jbw-FISd5NnFg")

OWNER_ID = int(os.environ.get("OWNER_ID", "6629551092"))  # Your Telegram user ID
SUDO_USERS = list(map(int, os.environ.get("SUDO_USERS", "").split()))  # Space-separated user IDs

MONGO_URL = os.environ.get("MONGO_URL", "mongodb+srv://kingkamail901:cUd94FlrYtXUcDkl@cluster0.rri4k5c.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0")##your mongo url eg: withmongodb+srv://xxxxxxx:xxxxxxx@clusterX.xxxx.mongodb.net/?retryWrites=true&w=majority
CHANNEL_ID = int(os.environ.get("CHANNEL_ID", "-1002324274061"))  # Telegram channel ID (with -100 prefix)

PREMIUM_LOGS = os.environ.get("PREMIUM_LOGS", "-1002387708731")  # Optional here you'll get all logs
