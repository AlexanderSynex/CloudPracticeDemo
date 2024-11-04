FROM python:3.8-slim

WORKDIR /pipeline
COPY . .
RUN pip install --no-cache-dir -r requirements.txt
CMD ["python3", "app.py"]