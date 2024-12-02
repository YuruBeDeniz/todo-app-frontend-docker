# Stage: base
FROM node:20 AS base
# Set working directory
WORKDIR /app

# Stage: dependencies
FROM base AS dependencies
# Copy package.json and package-lock.json to the container
COPY package*.json ./
# Install dependencies using npm
RUN npm install

# Stage: build
FROM dependencies AS build
# Copy the entire project to the container
COPY . .
# Build the Angular application
RUN npm run build

# Stage: production
FROM nginx:stable AS production
# Copy build output to Nginx's default directory
COPY --from=build /app/dist/todo-app-frontend/browser /usr/share/nginx/html
# Expose the default Nginx port
EXPOSE 80
# Start Nginx & and prevent it from running as a background process
CMD ["nginx", "-g", "daemon off;"]

