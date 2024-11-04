FROM python:3.8
WORKDIR /pipeline
COPY . .
RUN pip install --upgrade pip && pip install --no-cache-dir -r requirements.txt
CMD ["python3", "app.py"]