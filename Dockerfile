# Build the Go application

FROM golang:latest AS builder

WORKDIR /app

# Clone your Go application from Git
RUN apt-get update && apt-get install -y git
RUN git clone https://github.com/Stalkerfish/infra-2023.git .

# Build the Go application
RUN go build -o infra23

# Create a production image

FROM alpine:latest

# Install Redis
RUN apk --no-cache add redis

# Copy the built Go application from the previous stage
COPY --from=builder /app/infra23 /usr/local/bin/infra23

# Expose the Redis port and specify the working directory
EXPOSE 6379
WORKDIR /app

# Command to run the Go application (assumes it connects to Redis at "localhost:6379")
CMD ["infra23"]
