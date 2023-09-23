# Using an Alpine image as the base

FROM golang:alpine

WORKDIR /app

# Clone your Go application from Git and Install Redis
RUN apk update && apk --no-cache add redis git
RUN git clone https://github.com/Stalkerfish/infra-2023.git .

# Build the application
RUN go build -o infra23

# Expose the Redis port and specify
EXPOSE 6379

# Specify the Redis data directory
VOLUME ["/data"]

# Set the Redis configuration file location
ENV REDIS_CONFIG_FILE /etc/redis/redis.conf

# Copy a custom Redis configuration file into the image (optional)
# COPY redis.conf $REDIS_CONFIG_FILE

# Command to run the Go application (assumes it connects to Redis at "localhost:6379")
CMD ["redis-server", "$REDIS_CONFIG_FILE"]
CMD ["go run ."]
