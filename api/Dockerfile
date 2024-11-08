FROM python:3.9-slim
WORKDIR /app
COPY requirements.txt app.py ./
RUN pip install -r requirements.txt
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "--workers", "1", "app:app"]