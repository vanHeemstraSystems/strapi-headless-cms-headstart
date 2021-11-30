# 200 - Docker for Development Environment

## 100 - Starting Strapi in Development Environment

To start your Strapi server in the future, navigate to the ```cms``` folder and run ```yarn develop```:

```
$ cd containers/app/cms
$ yarn develop
```

## 200 - Verify MongoDB for Development for Strapi

Verify if collections used by Strapi have been created in MongoDB for Development, by connecting to MongoDB for Development using a tool like Robo3T.

![Robo 3T MongoDB Dev Strapi Screen Shot](robo_3t_mongodb_dev_strapi_screen_shot.png)
Collections of Strapi in MongoDB for Development

## 300 - Create Your First User

You should be able to visit the ```admin``` panel of your project: http://localhost:1337/admin.

![Screenshot 2021-11-17 at 19 16 29](https://user-images.githubusercontent.com/1499433/142258921-abf0ff7d-1fb6-43de-b5e4-e0c515921014.png)

Add your first user from the registration page.

For the time being, enter your personal details as the first user (which will have administrator full access and privileges for now).

Hence, in my own case:

First name: **Willem**

Last name: **van Heemstra**

Email: **wvanheemstra@icloud.com**

Password: ```== not showing here ==```

Confirmation Password: ```== not showing here ==```

## 400 - Dockerize Strapi

Create a file called ```Dockerfile.dev``` in the ```cms``` directory.

```
$ cd containers/app/cms
$ touch Dockerfile.dev
```

Add the following content to this ```Dockerfile.dev``` file:

```
ARG IMAGE_REPOSITORY
# pull official base image
FROM ${IMAGE_REPOSITORY}/strapi/strapi:3.6.8-node14-alpine

# See https://stackoverflow.com/questions/29261811/use-docker-compose-env-variable-in-dockerbuild-file
ARG PROXY_USER
ARG PROXY_PASSWORD
ARG PROXY_FQDN
ARG PROXY_PORT
ARG DATABASE_CLIENT
ARG DATABASE_NAME
ARG DATABASE_HOST
ARG DATABASE_PORT
ARG DATABASE_USERNAME
ARG DATABASE_PASSWORD
ARG DATABASE_SSL
ARG AUTHENTICATION_DATABASE
ARG NODE_ENV

ENV HTTP_PROXY="http://${PROXY_USER}:${PROXY_PASSWORD}@${PROXY_FQDN}:${PROXY_PORT}"
ENV HTTPS_PROXY="http://${PROXY_USER}:${PROXY_PASSWORD}@${PROXY_FQDN}:${PROXY_PORT}"
ENV DATABASE_CLIENT=${DATABASE_CLIENT}
ENV DATABASE_NAME=${DATABASE_NAME}
ENV DATABASE_HOST=${DATABASE_HOST}
ENV DATABASE_PORT=${DATABASE_PORT}
ENV DATABASE_USERNAME=${DATABASE_USERNAME}
ENV DATABASE_PASSWORD=${DATABASE_PASSWORD}
ENV DATABASE_SSL=${DATABASE_SSL}
ENV AUTHENTICATION_DATABASE=${AUTHENTICATION_DATABASE}
ENV NODE_ENV=${NODE_ENV}

# set working directory
WORKDIR /srv/app

# add `/app/node_modules/.bin` to $PATH
# WAS: ENV PATH /app/node_modules/.bin:$PATH

# install app dependencies
# WAS: COPY package.json ./
# WAS: COPY package-lock.json ./
RUN apk add --update alpine-sdk python3 py3-pip
# WAS: RUN npm install --silent

# add app
# WAS: COPY . ./

# expose port
EXPOSE 1436

# start app
# WAS: CMD ["yarn", "develop"]
```
containers/app/cms/Dockerfile.dev

***Note***: we add the alpine software development kit (sdk) ```alpine-sdk``` and ```python3 py3-pip``` to be able to build missing libraries.

***Note***: if you are ***not*** behind a proxy, comment out the following lines in Dockerfile.dev, like so:

```
# See https://stackoverflow.com/questions/29261811/use-docker-compose-env-variable-in-dockerbuild-file
# ARG PROXY_USER
# ARG PROXY_PASSWORD
# ARG PROXY_FQDN
# ARG PROXY_PORT

# ENV HTTP_PROXY="http://${PROXY_USER}:${PROXY_PASSWORD}@${PROXY_FQDN}:${PROXY_PORT}"
# ENV HTTPS_PROXY="http://${PROXY_USER}:${PROXY_PASSWORD}@${PROXY_FQDN}:${PROXY_PORT}"
```
containers/app/cms/Dockerfile.dev

Create a file called ```.dockerignore``` inside the ```cms``` directory.

```
$ cd containers/app/cms
$ touch .dockerignore 
```

Add the following content to ```.dockerignore```:

```
node_modules
.dockerignore
Dockerfile.dev
Dockerfile.prod
```
containers/app/cms/.dockerignore

Copy sample files:

```
$ cd containers/app/cms
$ cp sample.env .env
```

Now let us add the ```cms``` service to ```sample.docker-compose.dev.yml``` by this entry:

```
...
service:
...
  cms:
    secrets:
      - database_password
      - proxy_password  
    build:
      context: ./cms
      dockerfile: Dockerfile.dev
      args: # from env_file
        UNIQUE_NAMESPACE: ${UNIQUE_NAMESPACE}     
        IMAGE_REPOSITORY: ${IMAGE_REPOSITORY}
        PROXY_USER: ${PROXY_USER}
        PROXY_PASSWORD: ${PROXY_PASSWORD}
        PROXY_FQDN: ${PROXY_FQDN}
        PROXY_PORT: ${PROXY_PORT}
        DATABASE_CLIENT: ${DATABASE_CLIENT}
        DATABASE_NAME: ${DATABASE_NAME}
        DATABASE_HOST: ${DATABASE_HOST}
        DATABASE_PORT: ${DATABASE_PORT}
        DATABASE_USERNAME: ${DATABASE_USERNAME}
        DATABASE_PASSWORD: ${DATABASE_PASSWORD}
        DATABASE_SSL: ${DATABASE_SSL}
        AUTHENTICATION_DATABASE: ${AUTHENTICATION_DATABASE}        
        NODE_ENV: development
    env_file:
      - .env
    container_name: ${UNIQUE_NAMESPACE}-cms-dev      
    ports:
      - "1436:1337"
    volumes:
      - ./cms:/srv/app      
      - /cms/node_modules      
...

```
containers/app/sample.docker-compose.dev.yml

***Note***: The volumes option ```./cms:/srv/app``` uses the service's folder (here: ```containers/app/cms```) on your computer that will be shared with the docker container (at ```/srv/app```).

Before running docker-compose, make sure when on a Linux RHEL server, set enforcing to permissive, like so:

```
$ getenforce
$ Enforcing
$ sudo setenforce 0
$ getenforce
$ Permissive
```

```
$ cd containers/app
$ docker-compose --file docker-compose.dev.yml --project-name cms-dev up --build -d
```

**Note**:   
```
-p, --project-name NAME     Specify an alternate project name
                              (default: directory name)
``` 

Fingers crossed ... !

***Note***: If it failed with ```standard_init_linux.go:219: exec user process caused: permission denied```, you may decide to give read/write/execute (rwx) rights to all users, group, and others in Linux for the ```cms``` folder as follows: 

```
$ cd containers/app
$ chmod ugo+rwx cms
```

***Note***: If it failed with ```exec user process caused „no such file or directory```, read https://futurestud.io/tutorials/how-to-fix-exec-user-process-caused-no-such-file-or-directory-in-docker

***Note***: If you get something like ```[Error: EACCES: permission denied, rmdir '/srv/app'] ```, read https://github.com/strapi/strapi-docker/issues/107

If successful, you can browse to the start page of the new React App, which will look like below:

![React App Screen Shot](react_app_screen_shot.png)

http://localhost:8080

Now check if we can also see the ```strapi``` server at http://localhost:1436

![CMS Service Screen Shot](cms_service.png)

http://localhost:1436

== WE ARE HERE ==
