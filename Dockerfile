# Use a minimal Nginx image as the base image
FROM nginx:alpine

# Copy the HTML files into the container's web root directory
COPY . /usr/share/nginx/html

# Expose port 80 to the outside world
EXPOSE 80
