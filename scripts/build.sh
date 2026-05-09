#!/bin/bash

# Build script for local testing
set -e

echo "🔨 Building Docker images..."

# Build backend
docker build -t myapp-backend:latest ./backend

# Build frontend
docker build -t myapp-frontend:latest ./frontend

echo "✅ Build completed!"

# Test images
echo "🧪 Testing images..."
docker run --rm myapp-backend:latest php -v
docker run --rm myapp-frontend:latest nginx -v

echo "🎉 All tests passed!"
