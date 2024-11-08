from flask import Flask, request
import requests
from loguru import logger
import sys

app = Flask(__name__)

# Configure loguru
logger.remove()
logger.add(
    sys.stdout,
    format="<green>{time:YYYY-MM-DD HH:mm:ss.SSS}</green> | <level>{level: <8}</level> | <cyan>{name}</cyan>:<cyan>{function}</cyan>:<cyan>{line}</cyan> - <level>{message}</level>",
    colorize=True,
)

@app.route('/')
def home():
    return 'Try /load?url=http://www.google.com'

@app.route('/load')
def load_url():
    url = request.args.get('url')
    logger.info(f"Got request URL: {url}")
    if url:
        try:
            response = requests.get(url, timeout=5)
            return response.text
        except Exception as e:
            logger.exception("Error making request")
            return str(e)
    return "No URL provided"
