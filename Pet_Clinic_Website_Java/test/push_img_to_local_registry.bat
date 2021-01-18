ECHO OFF

docker stop testcontainer
docker rm testcontainer

@REM Couldn't use "- < mavenjdkagent.Dockerfile" as the "ADD" command
@REM wouldn't find the directory to copy from. 
docker build --no-cache -t localhost:5000/test123:v1 .
@REM docker push localhost:5000/test123:v1

docker run -d --name testcontainer localhost:5000/test123:v1

docker exec -it testcontainer bash