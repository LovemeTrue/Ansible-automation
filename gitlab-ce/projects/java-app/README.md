## Simple java-app for testing purposes which:
1. Runs a http server on `8080` port in Docker Container.
2. To accept GET request
3. Returns 'Hello World from Python!' on a GET request

## To check app's health use:
```
docker inspect --format='{{json .State.Health}}' java-app | jq
```