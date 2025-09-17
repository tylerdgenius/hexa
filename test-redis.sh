#!/bin/bash

# Redis Service Test Script
# This script demonstrates basic Redis operations and verifies the service is working

echo "==========================================="
echo "    Hexa Redis Service Test Script"
echo "==========================================="
echo

# Check if services are running
echo "1. Checking service status..."
docker compose ps
echo

# Test Redis connectivity
echo "2. Testing Redis connectivity..."
docker exec hexa_redis redis-cli ping
echo

# Set some test data
echo "3. Setting test data..."
docker exec hexa_redis redis-cli set "app:name" "Hexa Redis Service"
docker exec hexa_redis redis-cli set "app:version" "1.0.0"
docker exec hexa_redis redis-cli set "app:description" "A Redis service with Redis Commander for monitoring"
echo "✅ Test data has been set"
echo

# Retrieve test data
echo "4. Retrieving test data..."
echo "App Name: $(docker exec hexa_redis redis-cli get "app:name")"
echo "App Version: $(docker exec hexa_redis redis-cli get "app:version")"
echo "App Description: $(docker exec hexa_redis redis-cli get "app:description")"
echo

# Show some Redis info
echo "5. Redis server information..."
docker exec hexa_redis redis-cli info server | grep redis_version
docker exec hexa_redis redis-cli dbsize
echo

# Test Redis Commander connectivity
echo "6. Testing Redis Commander web interface..."
if curl -s -o /dev/null -w "%{http_code}" http://localhost:8081 | grep -q "200"; then
    echo "✅ Redis Commander is accessible at http://localhost:8081"
else
    echo "❌ Redis Commander is not accessible"
fi
echo

echo "==========================================="
echo "        Service Access Information"
echo "==========================================="
echo "Redis Server:     localhost:6379"
echo "Redis Commander:  http://localhost:8081"
echo "Redis CLI:        docker exec hexa_redis redis-cli"
echo "==========================================="