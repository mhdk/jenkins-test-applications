FROM jenkins/jenkins:lts

# for installing via apt
USER root

# installing maven and adding it to the path.
RUN apt-get update && apt-get install -y maven \
                   && export MAVEN_HOME=/usr/share/maven \
                   && export PATH=$PATH:$MAVEN_HOME/bin

# drop back to the regular jenkins user - good practice
USER jenkins
