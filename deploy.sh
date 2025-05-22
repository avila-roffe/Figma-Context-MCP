#!/bin/bash

PROJECT_ID="ar-system-design"
SERVICE_NAME="figma-mcp"
REGION="us-east1"

# Authenticate (uncomment if needed)
# gcloud auth login
# gcloud config set project $PROJECT_ID

echo "Building and pushing Docker image to gcr.io/$PROJECT_ID/$SERVICE_NAME..."
gcloud builds submit --tag gcr.io/$PROJECT_ID/$SERVICE_NAME

echo "Deploying to Cloud Run..."
gcloud run deploy $SERVICE_NAME \
  --image gcr.io/$PROJECT_ID/$SERVICE_NAME \
  --platform managed \
  --region $REGION \
  --allow-unauthenticated \
  --port 3000

echo "Deployment complete! Visit the Cloud Run service URL in your console."