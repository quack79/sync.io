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

# Expose the port that the application will run on
# Replace 8080 with the actual port number specified in the README
# EXPOSE 8080

# Set the entrypoint to run the application
ENTRYPOINT ["./Sync.io"]

