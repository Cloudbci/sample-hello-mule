# Use Maven 3.9.6 with Eclipse Temurin JDK 17 on Alpine as the base image
FROM maven:3.9.6-eclipse-temurin-17-alpine

# Install wget and gnupg
RUN apk add --no-cache wget gnupg

# Add JFrog GPG key
RUN wget -qO - https://releases.jfrog.io/artifactory/jfrog-gpg-public/jfrog_public_gpg.key | gpg --import -

# Add JFrog Alpine repository to APK repositories
RUN echo "https://releases.jfrog.io/artifactory/jfrog-alpine" >> /etc/apk/repositories

# Install JFrog CLI
RUN apk update && \
    apk add --no-cache jfrog-cli-v2-jf

# Set up default command to run when container starts
CMD ["bash"]
