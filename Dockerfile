FROM python:3.8-slim
RUN pip install --no-cache-dir -r requirements.txt
WORKDIR /pipeline
COPY . .
CMD ["python3", "app.py"]