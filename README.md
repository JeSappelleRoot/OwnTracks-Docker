- [OwnTracks with Docker](#owntracks-with-docker)
  - [Requirements](#requirements)
  - [Clone repository](#clone-repository)
  - [Change password](#change-password)
  - [Generate new certificates and keys](#generate-new-certificates-and-keys)
  - [Launch Owntracks application](#launch-owntracks-application)


# OwnTracks with Docker

## Requirements

**Owntracks can only be used on Debian x64 bits version**

On your host/virtual machine, just run following commands : 
```
apt-get update
apt-get install -y openssl git docker.io docker-compose
```

## Clone repository

Run `git clone https://github.com/JeSappelleRoot/OwnTracks-Docker.git` to clone Owntracks repository.  
Then, move to the repo with `cd OwnTracks-Docker`

## Change password

In `docker-compose.yml`, change the following lines : 

* **On `# Mosquitto DB config` section, change username and password**
```
DB_USER: dbo
DB_PASSWORD : Passw0rd
```

* **On `# ot-recorder config` section, change username and password (same as above)**
```
DB_USER: dbo
DB_PASSWORD : Passw0rd
```

* **On `# Reverse proxy config` section, change username and password**
```
PROXY_USER: admin
PROXY_PASSWORD: Passw0rd
```
> This user/password will be use to access to the `\table` website directory


## Generate new certificates and keys

Use the bash script to generate certificates used by Mosquitto DB, Nginx and Ot-Recorder.  
Simply launch the script with `./genkey.sh`.  
Then, transfer the CA file `./ot-recorder/CA/ca.crt` to your smartphone. This file will be use to the authentificate your app with the database. 

## Launch Owntracks application

Simply run `docker-compose up` and let the magic operate !  
> Your Owntracks application will be available with your virtual machine IP address  
> Use `docker-compose up -d` to launch containers in detach mode

