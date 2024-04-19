# Use Maven 3.9.6 with Eclipse Temurin JDK 17 on Ubuntu as the base image
FROM maven:3.9.6-eclipse-temurin-17

# Install wget and gnupg
USER root
RUN apt-get update && \
    apt-get install -y wget gnupg && \
    rm -rf /var/lib/apt/lists/*

# Add JFrog GPG key
RUN wget -qO - https://releases.jfrog.io/artifactory/jfrog-gpg-public/jfrog_public_gpg.key | apt-key add -

# Add JFrog repository to sources.list
RUN echo "deb https://releases.jfrog.io/artifactory/jfrog-debs xenial contrib" >> /etc/apt/sources.list && \
    apt-get update

# Install JFrog CLI
RUN apt-get install -y jfrog-cli-v2-jf && \
    rm -rf /var/lib/apt/lists/*

# Create a jenkins user
RUN groupadd -g 1000 jenkins && useradd -u 1000 -g jenkins -ms /bin/bash jenkins && \
    # Debugging: Print current user and directory permissions
    whoami && ls -l /home/jenkins && \
    mkdir /home/jenkins/.jfrog && chown -R jenkins:jenkins /home/jenkins/.jfrog

# Switch to the jenkins user
USER jenkins

# Set the working directory
WORKDIR /home/jenkins

# Set up default command to run when container starts
CMD ["bash"]
