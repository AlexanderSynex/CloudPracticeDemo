FROM python:3.8-slim
WORKDIR /pipeline
COPY . .
RUN pip install -r requirements.txt
CMD python3 app.py