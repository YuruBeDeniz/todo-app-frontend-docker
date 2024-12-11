# TodoAppFrontend

## to run the container

docker build -t todo-app-frontend:latest .

docker run -d -p 4200:80 todo-app-frontend

## to stop the container
docker stop container_name/id
docker rm container_name/id

## after adding docker-compose.yaml
docker compose up -d
docker compose down

### readings
https://medium.com/@nadir.inab.dev/dockerizing-your-angular-app-a-quick-guide-00a3ecabe419