#!/bin/bash

# Prompt user for URLs
read -p "Enter URLs (comma-separated): " urls

# Create services.yaml content
yaml_content="http:
  routers:
    main:
      entryPoints:
        - "web"
      rule: \"Path(`/`\"
      service: balancer

  services:
    balancer:
      loadBalancer:
        healthCheck:
            path: /
            interval: \"10s\"
            timeout: \"5s\"
        servers:
"

# Parse and add URLs to YAML content
IFS=',' read -ra url_array <<< "$urls"
for url in "${url_array[@]}"; do
  yaml_content+="        - url: \"$url\"\n"
done

# Write YAML content to services.yaml file
echo -e "$yaml_content" > services.yaml

echo "Services generated successfully."