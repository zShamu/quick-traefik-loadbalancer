# Traefik Configuration with Dynamic Service Discovery

This repository contains a basic setup for Traefik as a reverse proxy with dynamic service discovery using Docker and a custom `services.yaml` file.

## Traefik Setup

### Prerequisites

- Docker installed on your system
- Docker Compose installed on your system

### Usage

1. Clone this repository:

   ```bash
   git clone https://github.com/zShamu/quick-traefik-loadbalancer.git
   cd quick-traefik-loadbalancer
   ```

2. Create a `services.yaml` file using the provided Bash script:

   ```bash
   sudo ./deploy.sh
   ```

   Follow the prompts to enter the URLs / IP addresses.


3. Access the Traefik dashboard:

   Open [http://localhost:8080/](http://localhost:8080/) in your web browser. You can monitor the configured services and routing rules from the Traefik dashboard.

4. Test the dynamic service discovery:

   - Create and deploy Docker containers with the desired URLs.
   - Traefik will automatically discover and route traffic to these containers based on the rules defined in the `services.yaml` file.

5. Stop Traefik and clean up:

   ```bash
   docker compose down traefik
   ```

## Customization

- Adjust the Traefik configuration in the `docker-compose.yaml` file as needed.
- Modify the `deploy.sh` script or manually edit the `services.yaml` file to customize entryPoints, URLs and more.

## License

This project is licensed under the MIT License - see the license file for details.
