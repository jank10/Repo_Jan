# Use the official Python image from Docker Hub
FROM python:3.9

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed dependencies specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Make port 80 available to the world outside this container
EXPOSE 80

# Define environment variable
ENV NAME World

# Mount a volume to /app/data
VOLUME /app/data

# Run app.py when the container launches
CMD ["python", "app.py"]

# Add additional configuration or commands below
# For example:

# Set timezone to UTC
ENV TZ=UTC

# Set a label with maintainer information
LABEL maintainer="yourname@example.com"

# Create a directory for logs
RUN mkdir /app/logs

# Set permissions for the logs directory
RUN chmod 755 /app/logs

# Healthcheck to ensure the container is running correctly
HEALTHCHECK --interval=30s --timeout=10s \
  CMD curl -f http://localhost/ || exit 1
