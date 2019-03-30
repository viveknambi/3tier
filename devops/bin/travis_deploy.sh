#!/bin/bash -eu

if ! command -v aws >/dev/null 2>&1; then
  pip install --user awscli
  export PATH=$PATH:$HOME/.local/bin # put aws in the path
fi

eval $(aws ecr get-login --region us-east-1 --no-include-email)

docker tag 3tier_api:latest ${REGISTRY}/three_tier_api
docker push ${REGISTRY}/three_tier_api
aws ecs update-service --cluster api-production --service api-production --force-new-deployment

docker tag 3tier_web:latest ${REGISTRY}/three_tier_web
docker push ${REGISTRY}/three_tier_web
aws ecs update-service --cluster web-production --service web-production --force-new-deployment
