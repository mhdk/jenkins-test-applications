ECHO OFF

@REM Couldn't use "- < mavenjdkagent.Dockerfile" as the "ADD" command
@REM wouldn't find the directory to copy from.
docker build -t localhost:5000/docker-agent-mavenjdk:v1 .
docker push localhost:5000/docker-agent-mavenjdk:v1

docker run localhost:5000/docker-agent-mavenjdk:v1