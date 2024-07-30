# Use the official Nginx image from the Docker Hub
FROM nginx:alpine

# Set the working directory to the Nginx html directory
WORKDIR /usr/share/nginx/html

# Copy all the files from the current directory to the working directory
COPY . .

# Expose port 80 to the outside world
EXPOSE 80

# Start Nginx when the container launches
CMD ["nginx", "-g", "daemon off;"]
