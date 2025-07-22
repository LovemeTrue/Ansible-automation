## Simple flask-app for testing purposes which:
1. Runs a Flask server on `5000` port in Docker Container.
2. To accept GET request
3. Returns 'Hello World from Python!' on a GET request

## To check app's health use:
```
docker inspect --format='{{json .State.Health}}' flask-app | jq
```