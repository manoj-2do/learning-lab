# What I Learned About Docker

This repository is a comprehensive example of how to dockerize a full-stack application. By building this project, I learned the following key Docker concepts:

## 1. Docker Compose for Multi-Container Applications
I learned how to use `docker-compose.yaml` to orchestrate multiple services (`backend`, `frontend`, `mongodb`, and `mongo-express`) together. This allows all services to communicate with each other on the same network automatically.

## 2. Multi-Stage Builds (Backend)
In `backend/Dockerfile`, I implemented a **multi-stage build**:
- **Builder Stage**: Uses a base Python image to install dependencies and compile wheel (`.whl`) files using `pip wheel`.
- **Runner Stage**: Uses a fresh, lightweight Python image to install these pre-compiled wheels.
This drastically reduces the final image size by leaving behind unnecessary build tools and cache.

## 3. Serving Static Files with Nginx (Frontend)
In `frontend/Dockerfile`, I learned how to serve static web files using a web server in Docker. I used the official `nginx` image, removed the default HTML files, and copied my custom `static/` folder into `/usr/share/nginx/html`.

## 4. Environment Variables via `.env` Files
Instead of hardcoding sensitive information or environment-specific configuration directly into the compose file, I used the `env_file` directive in `docker-compose.yaml`. This injects configurations securely from separate files (e.g., `./backend/.env`, `./mongodb/.env`).

## 5. Data Persistence with Volumes
I learned how to use **Docker Volumes** to persist database data. By configuring `mongodb-data:/data/db` for the MongoDB container, the database content remains safe and persistent even if the container is destroyed and recreated.

## 6. Port Mapping
I mapped container ports to host machine ports in `docker-compose.yaml` using the `ports` mapping (`HostPort:ContainerPort`). Examples:
- `8000:8000` for the backend API
- `80:80` for the Nginx frontend
- `8081:8081` for the Mongo Express UI

## 7. Container Configuration
- **Container Names**: Used `container_name` to assign human-readable names to containers instead of random generated hashes.
- **Pull Policies**: Set `pull_policy: never` for custom services to ensure Docker uses the locally built images instead of attempting to pull them from a remote registry.
- **Build contexts & targets**: Configured specific working directories (`context`) and targeted specific build stages (`target: runner`) directly inside the docker-compose file.

## 8. Prerequisites & Environment Setup
Before running the application, make sure your environment variables are all set up. Create a `.env` file anywhere a `.env_example` is present.

For example:
```bash
cp backend/.env_example backend/.env
cp mongodb/.env_example mongodb/.env
```

## 9. Running this Example
You can use `docker-compose` to run this specific example:

```bash
# Build and start the services in the background
docker-compose up -d --build

# View logs from all services
docker-compose logs -f

# Stop the services when done
docker-compose stop

# Stop and remove containers, networks, and volumes
docker-compose down
```
