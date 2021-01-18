FROM jenkins/jenkins:lts
# ----
# Install Maven
USER root

# ARG UNAME=jenkins
# ARG UID=1003
# ARG GID=1003

# # RUN groupadd -g $GID -o $UNAME && \
# #     useradd -m -u $UID -g $GID -o -s /bin/bash $UNAME
# RUN addgroup -S $GID && \
#     adduser -S $UID -G $GID

# USER $UNAME
# # CMD /bin/bash

# RUN addgroup -g 1003 jenkinsgroup && \
#     adduser -u 1003 -G jenkinsgroup -h /var/jenkins_home -D jenkins-mvn

# USER jenkins-mvn

RUN apt-get update && \
    apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

# Add Docker’s official GPG key
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - && \
    add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/debian \
    $(lsb_release -cs) \
    stable"

# Update the apt package index, and install the latest version of Docker 
# Engine and containerd. Adding the jenkins user to the docker user group.
# Also installing lxc and iptables to start docker.
RUN apt-get update && \
    apt-get install -y docker-ce docker-ce-cli containerd.io \
    lxc \
    iptables && \
    usermod -aG docker jenkins

# USER jenkins