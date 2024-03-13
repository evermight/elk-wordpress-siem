# Introduction

This project is explained by these videos:

1. Demonstration: TBD
2. Explanation: TBD

# Installation

Assume the `~/` reflects your project directory, meaning the same directory as the file `docker-compose.yml`.  So if your `docker-compose.yml` is in `/home/stephanie/wp/docker-compose.yml`, then all mentions of `~/` in the instructions below will mean `/home/stephanie/wp/`.

## Start ELK
1. Make a copy of `~/env.sample` to `~/.env`.  Optional - customize settings for better security.
2. Type `cd ~/` to return to project directory.
3. Type `docker-compose up --build -d` to start up the ELK project.
4. Login with `elastic` and the password found in the `~/.env` file to ensure the entire ELK stack is up and running.
5. Open your web browser and go to `https://<ip address or hostname of kibana>:5601`.
6. Accept any security warnings about untrusted SSL certificates.
