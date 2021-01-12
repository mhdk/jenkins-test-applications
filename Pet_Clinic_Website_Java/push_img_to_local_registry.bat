ECHO OFF

docker build -t localhost:5000/docker-agent-mavenjdk:v1 - < mavenjdkagent.Dockerfile
docker push localhost:5000/docker-agent-mavenjdk:v1

@REM docker run localhost:5000/docker-agent-mavenjdk:v1