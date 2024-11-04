FROM alpine:latest
WORKDIR /pipeline
RUN apk add python3 py3-pip
COPY . .
RUN pip install -r requirements.txt --break-system-packages
CMD python3 app.py