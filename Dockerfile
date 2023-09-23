# Using an Alpine image as the base

FROM alpine:latest

# Clone your Go application from Git
RUN apk update && apk add git
RUN git clone https://github.com/Stalkerfish/infra-2023.git .

# Download and Install Go
RUN wget -c https://go.dev/dl/go1.21.1.linux-amd64.tar.gz
RUN tar -C /usr/local -xzf go1.21.1.linux-amd64.tar.gz
￼
# Export Go $PATH
RUN export PATH=$PATH:/usr/local/go/bin

# Install Redis
RUN apk --no-cache add redis && \ 
 rm -rf /var/cache/apk/*

# Expose the Redis port and specify the working directory
EXPOSE 6379
WORKDIR /infra-2023

# Command to run the Go application (assumes it connects to Redis at "localhost:6379")
CMD ["go version"]
