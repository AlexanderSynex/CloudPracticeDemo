FROM python:3.8-slim
ADD requirements.txt

WORKDIR /pipeline
COPY . .
RUN pip install --no-cache-dir -r requirements.txt
CMD ["python3", "app.py"]