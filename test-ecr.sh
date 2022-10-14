#!/bin/sh
ACCOUNT_ID="564571135814"
AWS_DEFAULT_REGION="us-east-1"
REPOSITORY_URI="$ACCOUNT_ID.dkr.ecr.$AWS_DEFAULT_REGION.amazonaws.com"
IMAGE_REPO_NAME="evision"
VERSION=`cat version`
if [ -z "$VERSION" ]
then
    echo "\$VERSION is empty"
else
    docker build . --build-arg IMAGE_TAG=$VERSION --tag $REPOSITORY_URI/$IMAGE_REPO_NAME:$VERSION
    aws ecr get-login-password --region $AWS_DEFAULT_REGION | docker login --username AWS --password-stdin $REPOSITORY_URI 
    docker push $REPOSITORY_URI/$IMAGE_REPO_NAME:$VERSION
    docker tag $REPOSITORY_URI/$IMAGE_REPO_NAME:$VERSION $REPOSITORY_URI/$IMAGE_REPO_NAME:latest
    docker push $REPOSITORY_URI/$IMAGE_REPO_NAME:latest
fi
