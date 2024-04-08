# Use Maven 3.9.6 with Eclipse Temurin JDK 17 on Alpine as the base image
FROM maven:3.9.6-eclipse-temurin-17-alpine

# Install wget and gnupg
RUN apk add --no-cache wget gnupg

# Add JFrog GPG key
RUN wget -qO - https://releases.jfrog.io/artifactory/jfrog-gpg-public/jfrog_public_gpg.key | apt-key add -

# Add JFrog repository to sources.list
RUN echo "deb https://releases.jfrog.io/artifactory/jfrog-debs xenial contrib" | tee -a /etc/apt/sources.list && \
    apt update

# Install JFrog CLI
RUN apt install -y jfrog-cli-v2-jf

# Set up default command to run when container starts
CMD ["bash"]
