# Use the official Golang image as the base image
FROM golang:1.23rc2-alpine3.19

# Set the working directory inside the container
WORKDIR /app

# Install git
RUN apk update && apk upgrade && apk add git && apk add bash

# Clone the repository
RUN git clone https://github.com/KhushalJangid/sync.io.git .

# Install dependencies
RUN go get .

# Set Go environment variables
ENV GO111MODULE=on

# Build for all supported platforms
RUN chmod +x build.bash
RUN ./build.bash
RUN go build .

# Set the entrypoint to run the application
ENTRYPOINT ["./Sync.io"]
