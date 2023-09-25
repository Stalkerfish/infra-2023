# Using an Alpine image as the base

FROM alpine:latest

ENV PATH /usr/local/go/bin:$PATH

# Clone your Go application from Git and Install Redis
RUN apk update && apk add curl
COPY . ./infra-2023

WORKDIR infra-2023

# Install GO
RUN tar -C /usr/local -xzf go21.tar.gz

# Open port for connections
EXPOSE 2121
EXPOSE 6379

# Build go backend
RUN go build -o infra0

# Command to run the Go application (assumes it connects to Redis at "localhost:6379")
CMD ["./infra0"]
