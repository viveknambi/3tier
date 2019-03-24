#!/usr/bin/bash -eu

ACCOUNT_ID="758525302705"
REGISTRY="${ACCOUNT_ID}.dkr.ecr.us-east-1.amazonaws.com"

docker tag robertkinyon_api:latest ${REGISTRY}/three_tier_api
docker push ${REGISTRY}/three_tier_api

docker tag robertkinyon_web:latest ${REGISTRY}/three_tier_web
docker push ${REGISTRY}/three_tier_web
