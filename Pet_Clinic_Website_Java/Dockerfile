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

# Changing directory to the local repo and downloading all the
# dependencies specified in the POM file there.
WORKDIR $MAVEN_REPO
RUN mvn dependency:go-offline

# drop back to the regular jenkins user - good practice
#USER jenkins

### ************* need to change the run command in jenkinsfile to use the predownloaded
### packages ******************************************
#RUN mvn verify clean --fail-never