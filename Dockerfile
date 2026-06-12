FROM alpine:latest
RUN apk add --no-cache busybox-extras
WORKDIR /app
COPY install.sh .
EXPOSE 3000
CMD ["httpd", "-f", "-p", "3000", "-h", "/app"]