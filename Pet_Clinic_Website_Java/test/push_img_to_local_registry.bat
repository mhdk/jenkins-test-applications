ECHO OFF

docker stop testcontainer
docker rm testcontainer

@REM Couldn't use "- < mavenjdkagent.Dockerfile" as the "ADD" command
@REM wouldn't find the directory to copy from. 
@REM docker build --no-cache -t localhost:5000/test123:v1 .
@REM docker push localhost:5000/test123:v1

@REM docker run -d --name testcontainer localhost:5000/test123:v1


docker run -d ^
           --name testcontainer ^
           --rm ^
           --group-add 0 ^
           -v //var/run/docker.sock:/var/run/docker.sock ^
           -v //usr/local/bin/docker:/usr/local/bin/docker ^
           jenkins/jenkins:lts


docker exec -it testcontainer bash