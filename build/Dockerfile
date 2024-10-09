# Use a lightweight base image with bash
FROM alpine:latest

# Install bash if it's not present in the base image
RUN apk add --no-cache bash

# Set environment variables (optional, for example, if you have config files)
ENV CONFIG_PATH="/app/config"

# Create and set the working directory
WORKDIR /app

# Copy your project files into the container
COPY . /app

# Give execute permission to the main script
RUN chmod +x /app/main.sh

# If you need to install dependencies for your shell scripts, do so here
# For example: RUN apk add curl, git, etc.
# RUN apk add --no-cache <dependencies>

# Define the command to run your main shell script
CMD ["bash", "/app/main.sh"]
