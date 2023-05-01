#!/bin/bash

# Define the ACR login server
acr_login_server="acrappfaluz3.azurecr.io"
version="v1"
# Define the source image tags
shopping_api="mcr.microsoft.com/azuredocs/azure-vote-front:v1"


# Define the target image tags
target_shopping_api_tag="$acr_login_server/azure-vote-front:$version"
   
# Tag the server image
docker tag "$shopping_api" "$target_shopping_api_tag"

# Push the tagged images to the ACR
docker push "$target_shopping_api_tag"

