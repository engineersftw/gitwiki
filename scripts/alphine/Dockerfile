# Use the official Alpine image
FROM alpine:latest

# Install dependencies
RUN apk add --no-cache sox ffmpeg

# Set a working directory (optional)
WORKDIR /app

COPY . /app/

# Set the entrypoint (optional, can be adjusted as needed)
ENTRYPOINT ["/bin/sh"]
