- [OwnTracks with Docker](#owntracks-with-docker)
  - [Requirements](#requirements)
  - [Clone repository](#clone-repository)
  - [Change password](#change-password)
  - [Generate new certificates and keys](#generate-new-certificates-and-keys)
  - [Launch Owntracks application](#launch-owntracks-application)
- [Smartphone configuration](#smartphone-configuration)
- [Customize view](#customize-view)


# OwnTracks with Docker

## Requirements

**Owntracks can only be used on Debian x64 bits version**

On your host/virtual machine, just run the following commands : 
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

Simply run `docker-compose up` and let the magic happen !  
> Your Owntracks application will be available with your virtual machine IP address  
> Use `docker-compose up -d` to launch containers in detach mode

# Smartphone configuration

Launch OwnTracks application. 

* Tap on menu icon, in top left corner  

![01](https://user-images.githubusercontent.com/52102633/73560503-b4b8bb80-441c-11ea-830d-4cf71ac4de25.jpeg)

* Go to Preferences menu

![02](https://user-images.githubusercontent.com/52102633/73560504-b4b8bb80-441c-11ea-8324-4893d3cc2346.jpeg)

**Then go to Connection menu to configure application**

* In Mode option, choose MQTT

![00](https://user-images.githubusercontent.com/52102633/73560917-8c7d8c80-441d-11ea-8a69-42bd6b9e6df1.jpeg)

* In Host option, specify IP address of your Mosquitto database, and port 8883. Finally disable websockets 

![03](https://user-images.githubusercontent.com/52102633/73560505-b4b8bb80-441c-11ea-8a91-888de12f992d.jpeg)

> Adapt IP address to your virtual machine configuration

* In Identification option, specify `dbo` username and associated password. Specify a `Device ID` and a `Tracker ID`

![04](https://user-images.githubusercontent.com/52102633/73560506-b4b8bb80-441c-11ea-929e-2f6fcd8b34ad.jpeg)

> Adapt login and password to your configuration

* In Security option, enable TLS support and select your certificate create at this [step](#easily-generate-ca-and-certificates)

![05](https://user-images.githubusercontent.com/52102633/73560507-b4b8bb80-441c-11ea-8074-2e54c2b7ae81.jpeg)

* Finally, check connection to your Mosquitto database from `i` icon on right top corner of the application 

![06](https://user-images.githubusercontent.com/52102633/73560508-b5515200-441c-11ea-8e0b-4487db63d21e.jpeg)


# Customize view

OwnTracks allow you to customize maps with views
> View example [here](https://github.com/owntracks/recorder#display-map-with-points-starting-at-a-particular-date)

With our configuration, we can craft url with the following settings : 

```
https://<WEBSERVER>/map/index.html?user=dbo&device=MySmartphone&format=geojson&from=2019-01-01

https://<WEBSERVER>/map/index.html?user=dbo&device=MySmartphone&format=linestring&from=2019-01-01
```

The first URL could provide the following result :   
![with points](https://raw.githubusercontent.com/owntracks/recorder/master/assets/demo-geojson-points.png)

The second URL could provide the following result : 
![with lines](https://raw.githubusercontent.com/owntracks/recorder/master/assets/demo-geojson-linestring.png)
