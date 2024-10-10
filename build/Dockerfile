# Use a lightweight base image with bash
FROM alpine:latest

# Install bash, git, and curl (used to download kubectl)
RUN apk add --no-cache bash git curl

# Install kubectl
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" \
    && chmod +x kubectl \
    && mv kubectl /usr/local/bin/

# Create and set the working directory
WORKDIR /app

# Copy your project files into the container
COPY . /app

# Give execute permission to the main script
RUN chmod +x /app/main.sh \
    && chmod +x /app/bin/*.sh

# Define the command to run your main shell script
CMD ["bash", "/app/main.sh"]
