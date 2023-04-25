#!/bin/bash

# Create the certs directory and navigate to it
mkdir -p ~/certs/client
cd ~/certs/client

# Download the client certificate file
docker run --rm -v "$PWD:/certs" alpine cat /certs/client/cert.pem > ~/certs/client/cert.pem

# Check if the client certificate file exists
if [ ! -f "cert.pem" ]; then
    echo "Client certificate file not found in $PWD. Please download the client certificate manually and save it to this directory."
    exit 1
fi

# Set the environment variables for Docker TLS verification
export DOCKER_CERT_PATH=$HOME/certs
export DOCKER_TLS_VERIFY=1

# Test the Docker connection
docker version
