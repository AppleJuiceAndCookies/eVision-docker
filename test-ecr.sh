#!/bin/sh
ACCOUNT_ID="1234567890"
AWS_DEFAULT_REGION="us-east-1"
REPOSITORY_URI="$ACCOUNT_ID.dkr.ecr.$AWS_DEFAULT_REGION.amazonaws.com"
IMAGE_REPO_NAME="eVision"
docker pull centos:7
aws ecr get-login-password --region $AWS_DEFAULT_REGION | docker login --username AWS --password-stdin $REPOSITORY_URI 
docker tag centos:7 $REPOSITORY_URI/$IMAGE_REPO_NAME:latest
docker push $REPOSITORY_URI/$IMAGE_REPO_NAME:latest