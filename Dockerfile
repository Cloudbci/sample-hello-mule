# Use Maven 3.9.6 with Eclipse Temurin JDK 17 on Ubuntu as the base image
FROM maven:3.9.6-eclipse-temurin-17

# Install wget and gnupg
RUN apt-get update && \
    apt-get install -y wget gnupg && \
    rm -rf /var/lib/apt/lists/*

# Add JFrog GPG key
RUN wget -qO - https://releases.jfrog.io/artifactory/jfrog-gpg-public/jfrog_public_gpg.key | apt-key add -

# Add JFrog repository to sources.list
RUN echo "deb https://releases.jfrog.io/artifactory/jfrog-debs xenial contrib" >> /etc/apt/sources.list && \
    apt-get update

# Install JFrog CLI
RUN apt-get install -y jfrog-cli-v2-jf

# Set the working directory
WORKDIR /home/jenkins

# Set up default command to run when container starts
CMD ["bash"]
