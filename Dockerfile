FROM alpine:latest
WORKDIR /pipeline
RUN apk upgrade && apk add python3 py3-pip --force-missing-repositories
COPY . .
RUN pip install -r requirements.txt --break-system-packages
CMD python3 app.py