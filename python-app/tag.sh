#!/bin/bash

# Define the ACR login server
acr_login_server="myappacrfaluz.azurecr.io"

# Define the source image tags
source_server_tag="python-app-server:latest"
source_web_tag="python-app-webapp:latest"

# Define the target image tags
target_server_tag="$acr_login_server/server:v1"
target_web_tag="$acr_login_server/webapp:v1"

# Tag the server image
docker tag $source_server_tag $target_server_tag

# Tag the web image
docker tag $source_web_tag $target_web_tag

docker push myappacrfaluz.azurecr.io/server:v1

docker push myappacrfaluz.azurecr.io/webapp:v1

