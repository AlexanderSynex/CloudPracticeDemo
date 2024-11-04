FROM alpine:latest
WORKDIR /pipeline
RUN apk add --no-cache python3
COPY . .
RUN pip install -r requirements.txt --break-system-packages
CMD python3 app.py