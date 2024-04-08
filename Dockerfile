# Use Maven 3.9.6 with Eclipse Temurin JDK 17 on Alpine as the base image
FROM maven:3.9.6-eclipse-temurin-17-alpine

# Install JFrog CLI
RUN wget -q "https://releases.jfrog.io/artifactory/jfrog-cli/v2/2.1.4/jfrog-cli-linux-amd64/jfrog" -O /usr/bin/jfrog && \
    chmod +x /usr/bin/jfrog

# Set the working directory
WORKDIR /home/jenkins

# Set up default command to run when container starts
CMD ["bash"]
