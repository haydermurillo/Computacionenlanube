#!/bin/sh

# Esperar a que Consul esté listo
echo "Esperando a que Consul esté disponible..."
until curl -s http://consul:8500/v1/status/leader > /dev/null; do
  echo "Esperando a Consul..."
  sleep 1
done
echo "Consul está listo!"

# Register frontend service with Consul
curl -X PUT -d '{
  "ID": "frontend",
  "Name": "frontend",
  "Port": 5001,
  "Address": "frontend",
  "Tags": ["web"],
  "Check": {
    "HTTP": "http://frontend:5001/health",
    "Interval": "10s"
  }
}' http://consul:8500/v1/agent/service/register

# Register microusers service with Consul
curl -X PUT -d '{
  "ID": "microusers",
  "Name": "microusers",
  "Port": 5002,
  "Address": "microusers",
  "Tags": ["api"],
  "Check": {
    "HTTP": "http://microusers:5002/health",
    "Interval": "10s"
  }
}' http://consul:8500/v1/agent/service/register

# Register microproducts service with Consul
curl -X PUT -d '{
  "ID": "microproducts",
  "Name": "microproducts",
  "Port": 5003,
  "Address": "microproducts",
  "Tags": ["api"],
  "Check": {
    "HTTP": "http://microproducts:5003/health",
    "Interval": "10s"
  }
}' http://consul:8500/v1/agent/service/register

# Register microorders service with Consul
curl -X PUT -d '{
  "ID": "microorders",
  "Name": "microorders",
  "Port": 5004,
  "Address": "microorders",
  "Tags": ["api"],
  "Check": {
    "HTTP": "http://microorders:5004/health",
    "Interval": "10s"
  }
}' http://consul:8500/v1/agent/service/register

# Output registration status
echo "All microservices registered with Consul."