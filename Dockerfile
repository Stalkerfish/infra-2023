# Using an Alpine image as the base

FROM alpine:latest

ENV PATH /usr/local/go/bin:$PATH

# Clone your Go application from Git and Install Redis
RUN apk update && apk add --no-cache redis git curl
RUN git clone https://github.com/Stalkerfish/infra-2023.git

WORKDIR infra-2023

# Install GO
RUN tar -C /usr/local -xzf go21.tar.gz

# Expose the Redis port and specify
# EXPOSE 6379

# Specify the Redis data directory
# VOLUME ["/data"]

# Set the Redis configuration file location
# ENV REDIS_CONFIG_FILE /etc/redis/redis.conf

# Copy a custom Redis configuration file into the image (optional)
# COPY redis.conf $REDIS_CONFIG_FILE

# Build go backend
RUN go build -o infra0

# Command to run the Go application (assumes it connects to Redis at "localhost:6379")
CMD ["./infra0"]
