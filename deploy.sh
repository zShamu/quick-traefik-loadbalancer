#!/bin/bash

# Prompt user for URLs
read -p "Enter URLs (comma-separated): " urls

# Parse and add URLs to YAML content
IFS=',' read -ra url_array <<< "$urls"
yaml_content=""
for url in "${url_array[@]}"; do
  yaml_content+="        - url: \"http://$url/\"\n"
done

# Write YAML content to services.yaml file
echo -e "$yaml_content" >> services.yaml
echo "Services generated successfully."

sudo docker-compose up -d
echo "Load balancer generated successfully."