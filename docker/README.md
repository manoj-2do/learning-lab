# Docker Commands

## Examples

| Example | Description |
|---------|-------------|
| [example-01](./example-01) | Basic docker-compose example. |

## 1. Basic Docker Commands
Here are some essential, standalone Docker commands that are useful for managing images and containers individually:

| Action | Command | Description |
|--------|---------|-------------|
| **List running containers** | `docker ps` | Shows currently active containers. |
| **List all containers** | `docker ps -a` | Shows all containers, including stopped ones. |
| **List images** | `docker images` | Shows locally downloaded or built Docker images. |
| **Build an image** | `docker build -t <image_name> .` | Builds a Docker image using the `Dockerfile` in the current directory (`.`). |
| **Run a container** | `docker run -d -p 8080:80 <image_name>`| Runs a container in detached mode (`-d`) and maps host port 8080 to container port 80. |
| **Execute a command** | `docker exec -it <container> sh` | Opens an interactive shell session inside a running container. |
| **View logs** | `docker logs -f <container>` | Streams the log output of a specific container. |
| **Remove a container** | `docker rm -f <container>` | Forcefully removes a single container (even if it's currently running). |
| **Remove an image** | `docker rmi <image_id>` | Deletes a local Docker image from your system. |
| **System clean-up** | `docker system prune -a --volumes` | Removes all stopped containers, unused networks, dangling images, and volumes (use with caution). |

## 2. Docker Compose Commands (Colima & `docker-compose` v2)
Since I am using Colima instead of Docker Desktop, I use the standalone `docker-compose` (v2) CLI instead of the `docker compose` plugin.

| Action | Command | Description |
|--------|---------|-------------|
| **Start services** | `docker-compose up -d --build` | Builds, (re)creates, and starts containers in the background. |
| **Stop services** | `docker-compose stop` | Stops running containers without removing them or their data. |
| **Stop and Delete** | `docker-compose down` | Stops containers and removes containers, networks, and default volumes. |
| **View port mappings** | `docker ps` | Lists running containers, showing statuses and port mappings (e.g., `0.0.0.0:8000->8000/tcp`). |
| **Check specific port**| `docker port <container_name>` | Lists port mappings for a specific container (e.g., `docker port mysite-backend`). |
| **Delete a container** | `docker rm -f <container_name>`| Force removes a specific container. |
| **View logs** | `docker-compose logs -f` | Follows log output from all services. |
