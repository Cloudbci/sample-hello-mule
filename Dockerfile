# Use Maven 3.9.6 with Eclipse Temurin JDK 17 on Alpine as the base image
FROM maven:3.9.6-eclipse-temurin-17-alpine

# Install wget and gnupg
RUN apk add --no-cache wget gnupg

# Add JFrog GPG key
RUN wget -qO - https://releases.jfrog.io/artifactory/jfrog-gpg-public/jfrog_public_gpg.key | gpg --import -

# Add JFrog repository to sources.list
RUN echo "https://releases.jfrog.io/artifactory/jfrog-debs xenial contrib" >> /etc/apk/repositories && \
    apk update

# Install JFrog CLI
RUN apk add --no-cache jfrog-cli-v2-jf

# Set up default command to run when container starts
CMD ["bash"]
