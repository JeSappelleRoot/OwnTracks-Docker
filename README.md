- [OwnTracks with Docker](#owntracks-with-docker)
  - [Requirements](#requirements)
  - [Clone repository](#clone-repository)
  - [Generate new certificates and keys](#generate-new-certificates-and-keys)
  - [Launch Owntracks application](#launch-owntracks-application)


# OwnTracks with Docker

## Requirements

**Owntracks can only be used on Debian x64 bits version**

On your host/virtual machine, just run following commands : 
```
apt-get update
apt-get install openssl git docker.io docker-compose
```

## Clone repository

Run `git clone https://github.com/JeSappelleRoot/OwnTracks-Docker.git` to clone Owntracks repository.  
Then, move to the repo with `cd Owntracks-Docker`

## Generate new certificates and keys

Use the bash script to generate certificates used by Mosquitto DB, Nginx and Ot-Recorder.  
Simply launch the script with `./genkey.sh`

## Launch Owntracks application

Simply run `docker-compose up` and let the magic operate !  

