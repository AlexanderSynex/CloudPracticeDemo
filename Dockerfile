FROM alpine:latest
WORKDIR /pipeline
RUN apk upgrade
COPY . .
RUN apk add python3 py3-pip
RUN pip install -r requirements.txt --break-system-packages
CMD python3 app.py