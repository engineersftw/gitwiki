# Use the official Debian image
FROM debian:latest

# Install dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    sox ffmpeg && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Set a working directory (optional)
WORKDIR /app

COPY . /app/

# Set the entrypoint (optional, can be adjusted as needed)
ENTRYPOINT ["/bin/bash"]
