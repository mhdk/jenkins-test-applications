ECHO OFF

docker stop testcontainer
docker rm testcontainer

@REM Couldn't use "- < mavenjdkagent.Dockerfile" as the "ADD" command
@REM wouldn't find the directory to copy from.
docker build -t localhost:5000/docker-agent-mavenjdk:v1 .
docker push localhost:5000/docker-agent-mavenjdk:v1

docker run -d --name testcontainer localhost:5000/docker-agent-mavenjdk:v1

docker exec -it testcontainer bash