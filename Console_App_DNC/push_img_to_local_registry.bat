ECHO OFF

docker build -t localhost:5000/docker-agent-dnc:v1 - < dotnetcore.Dockerfile
docker push localhost:5000/docker-agent-dnc:v1