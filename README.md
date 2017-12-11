# Atlassian Confluence Docker

## Run single container

Just run `docker run -it --name confluence -p 8090:8090 webinventions/atlassian-confluence` and open browser http://127.0.0.1:8090

## Docker compose

Run `docker-compose up -d` and open browser http://127.0.0.1:8080 and use following settings `host: postgres`, `user: confluence`, `password: confluence`, `database: confluence`.
