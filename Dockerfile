FROM ubuntu:22.04 
  
# Install dependencies (JDK 8, Git, and JFrog CLI)
RUN apt update && \
    DEBIAN_FRONTEND=noninteractive apt install -y wget openjdk-17-jdk maven=3.8.4 && \
    rm -rf /var/lib/apt/lists/*
    
# Set the working directory
WORKDIR /home/jenkins
 
# RUN apt-get update && \
#     apt-get install -y && \
#     curl -fL https://getcli.jfrog.io | sh && java --version && mvn --version


# Install JFrog CLI
RUN wget -q "https://releases.jfrog.io/artifactory/jfrog-cli/v2/2.1.2/jfrog-cli-linux-amd64/jfrog" -O /usr/bin/jfrog && \
    chmod +x /usr/bin/jfrog
 
# Entry point for Jenkins to run commands
CMD ["/bin/bash"]
