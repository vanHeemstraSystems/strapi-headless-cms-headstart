# 100 - Service Setup

## 100 - Install Create React App globally

Not applicable.

## 200 - Setup the directory structure

Not applicable.

## 300 - Generate a new app

### Install Strapi

Having a frontend is good, but your app obviously needs a backend to manage users, restaurants, dishes and orders. To make the magic happen, let's create a Strapi API.

***Requirements***: please make sure to use version >=Node 9 and have either MongoDB, Postgres or MySQL installed and running on your machine. Here we will be using MongoDB, so make sure you have MongoDB up and running as explained in https://github.com/vanHeemstraSystems/mongodb-headstart.

***Note***: We will actually install **only** the **backend (Strapi code)** here, as the front end will be installed in https://github.com/vanHeemstraSystems/strapi-head-of-cms-headstart.

***Note***: I am using the current versions of all packages as of the time of writing May 2020. Locking these versions will ensure compatibility in the future. Should you use the current versions of these packages, you may need to update the code according to the documentation of the appropriate package. Upgrade packages at your own will.

Install ```yarn``` [here](https://yarnpkg.com/lang/en/docs/install/#mac-stable) if you do not have it:

Inside the subdirectory /containers/app/ created a new app called '***cms***':

```
$ cd containers/app
$ yarn create strapi-app cms
$ cd cms
```

You will need to do a manual install of Strapi (not quickstart) in order to use MongoDB.

Use your down arrow key and select Custom (manual settings) and press enter:





== WE ARE HERE ==

