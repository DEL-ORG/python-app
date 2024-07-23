# Use Ubuntu as the base image
FROM ubuntu:latest

# Set the working directory
WORKDIR /app

# Install Python3 and Python3-pip
RUN apt-get update && \
    apt-get install -y python3 python3-pip

# Copy the application code into the container
COPY . /app

# Install the required Python packages
RUN pip3 install -r requirements.txt

# Expose the port the app runs on
EXPOSE 8000

# Set the entry point and command to run the application
CMD ["python3", "manage.py", "runserver", "0.0.0.0:8000"]

