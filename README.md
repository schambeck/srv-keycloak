# Keycloak SSO with Identity and Access Management
[![maven](https://github.com/schambeck/srv-keycloak/actions/workflows/docker-image.yml/badge.svg)](https://github.com/schambeck/srv-keycloak/actions/workflows/maven.yml)

## Server Deployment

### Build docker image

    make docker-build

### Initialize Swarm

    docker swarm init

### Deploy Stack

    make stack-deploy

## Web UI

### Admin Console

    http://srv-keycloak.localhost/admin
    User: admin
    Pass: admin

### Account Console

    http://srv-keycloak.localhost/realms/schambeck/account
    User1: user01
    Pass1: password1
    User2: user02
    Pass2: password2
