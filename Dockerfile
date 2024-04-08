FROM maven:3.8.4-jdk-8
  
# Install dependencies (JDK 8, Git, and JFrog CLI)
RUN apt update && \
    DEBIAN_FRONTEND=noninteractive apt install -y curl && \
    apt clean
# Set the working directory
WORKDIR /home/jenkins
 
RUN apt-get update && \
    apt-get install -y && \
    curl -fL https://getcli.jfrog.io | sh && java --version && mvn --version
 
# Entry point for Jenkins to run commands
CMD ["/bin/bash"]
