FROM jenkins/jenkins:lts

# for installing via apt
USER root

# installing maven and adding it to the path.
RUN apt-get update && apt-get install -y maven

# Set the maven home variable and add it to path.
ENV MAVEN_HOME=/usr/share/maven
ENV PATH=$PATH:$MAVEN_HOME/bin
ENV MAVEN_REPO=$MAVEN_HOME/.m2/repository

# Making the directory for the local repository and removing the
# last line of the settings file so that the tag for the local repository
# can be added. The settings end tag is then added to the end.
RUN mkdir -p $MAVEN_REPO && \
    head -n -1 $MAVEN_HOME/conf/settings.xml > temp.txt && \
    mv temp.txt $MAVEN_HOME/conf/settings.xml && \
    echo '  <localRepository>/${MAVEN_REPO}</localRepository>' \
    >> $MAVEN_HOME/conf/settings.xml && \
    echo '</settings>' >> $MAVEN_HOME/conf/settings.xml && \
    cp $MAVEN_HOME/conf/settings.xml $MAVEN_HOME/.m2/settings.xml

# Setting env variable for the local repo path and adding the POM
# file of the project to this path.
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
# RUN chown -R jenkins $MAVEN_REPO
RUN chmod ugo+rwx $MAVEN_REPO
USER jenkins

### ************* need to change the run command in jenkinsfile to use the predownloaded
### packages ******************************************
#RUN mvn verify clean --fail-never

# chmod ugo+rwx foldername to give read, write, and execute to everyone.
# chmod a=r foldername to give only read permission for everyone.