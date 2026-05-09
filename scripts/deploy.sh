#!/bin/bash

# Deploy script
set -e

NAMESPACE=${1:-default}

echo "🚀 Deploying to Kubernetes namespace: $NAMESPACE"

# Deploy with Helm
cd helm-chart/myapp-chart
helm upgrade --install myapp . \
  --namespace $NAMESPACE \
  --create-namespace \
  --set frontend.image.tag=latest \
  --set backend.image.tag=latest

# Wait for rollout
echo "⏳ Waiting for rollout..."
kubectl rollout status deployment/frontend -n $NAMESPACE --timeout=300s
kubectl rollout status deployment/backend -n $NAMESPACE --timeout=300s

# Verify
echo "📊 Current status:"
kubectl get pods -n $NAMESPACE
kubectl get ingress -n $NAMESPACE

echo "✅ Deployment complete!"
