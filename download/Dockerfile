FROM bash:alpine3.15

RUN apk add parallel aria2
COPY . /download
RUN chmod +x /download/download.sh
ENTRYPOINT ["/download/download.sh"]
