# The Docker Branch

This branch contains the app as a working docker-ized application.

## Dependencies

- Docker
- Docker Compose

## Starting the app

```sh
cp .env.sample .env # Create a fresh config for starting
docker-compose up --build # Build and run the app
```

## Viewing the app

Open `localhost:8000` in your browser
