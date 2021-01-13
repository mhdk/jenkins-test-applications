FROM jenkins/jenkins:lts

# for installing via apt
USER root

# installing maven and adding it to the path.
RUN apt-get update && apt-get install -y maven

# Set the maven home variable and add it to path.
ENV MAVEN_HOME=/usr/share/maven
ENV PATH=$PATH:$MAVEN_HOME/bin

# Making the directory for the local repository and removing the
# last line of the settings file so that the tag for the local repository
# can be added. The settings end tag is then added to the end.
RUN mkdir $MAVEN_HOME/repository && \
    head -n -1 $MAVEN_HOME/conf/settings.xml > temp.txt && \
    mv temp.txt $MAVEN_HOME/conf/settings.xml && \
    echo '  <localRepository>/${MAVEN_HOME}/repository</localRepository>' \
    >> $MAVEN_HOME/conf/settings.xml && \
    echo '</settings>' >> $MAVEN_HOME/conf/settings.xml

# Setting env variable for the local repo path and adding the POM
# file of the project to this path.
ENV MAVEN_REPO=$MAVEN_HOME/repository
ADD jgsu-spring-petclinic/pom.xml $MAVEN_REPO 

# TESTING
# COPY jgsu-spring-petclinic/.  /usr/src
# RUN chown -R jenkins /usr/src

# Changing directory to the local repo and downloading all the
# dependencies specified in the POM file there.
WORKDIR $MAVEN_REPO
RUN mvn dependency:go-offline

# Changing ownership of repo folder to user 'jenkins'.
# drop back to the regular jenkins user - good practice
RUN chown -R jenkins $MAVEN_REPO
USER jenkins

### ************* need to change the run command in jenkinsfile to use the predownloaded
### packages ******************************************
#RUN mvn verify clean --fail-never

# [DEBUG] Reading global settings from /usr/share/maven/conf/settings.xml
# [DEBUG] Reading user settings from /var/jenkins_home/.m2/settings.xml
# [DEBUG] Reading global toolchains from /usr/share/maven/conf/toolchains.xml
# [DEBUG] Reading user toolchains from /var/jenkins_home/.m2/toolchains.xml
# [DEBUG] Using local repository at /var/jenkins_home/.m2/repository
# [DEBUG] Using manager EnhancedLocalRepositoryManager with priority 10.0 for /var/jenkins_home/.m2/repository
# [INFO] Scanning for projects...
# [DEBUG] Using transporter WagonTransporter with priority -1.0 for file:///usr/share/maven/repository
# [DEBUG] Using connector BasicRepositoryConnector with priority 0.0 for file:///usr/share/maven/repository
# Downloading: file:///usr/share/maven/repository/org/springframework/boot/spring-boot-starter-parent/2.3.1.RELEASE/spring-boot-starter-parent-2.3.1.RELEASE.pom

# [DEBUG] Writing tracking file /var/jenkins_home/.m2/repository/org/springframework/boot/spring-boot-starter-parent/2.3.1.RELEASE/spring-boot-starter-parent-2.3.1.RELEASE.pom.lastUpdated
# [DEBUG] Using transporter WagonTransporter with priority -1.0 for https://repo.maven.apache.org/maven2
# [DEBUG] Using connector BasicRepositoryConnector with priority 0.0 for https://repo.maven.apache.org/maven2
# Downloading: https://repo.maven.apache.org/maven2/org/springframework/boot/spring-boot-starter-parent/2.3.1.RELEASE/spring-boot-starter-parent-2.3.1.RELEASE.pom