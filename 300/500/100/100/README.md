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

Use your down arrow key and select **Custom (manual settings)** and press enter:

```
? Choose your installation type (Use arrow keys)
  Quickstart (recommended)
> Custom (manual settings) 
```

When asked to use a template, choose **n** for No:

```
? Choose your installation type (Use arrow keys): Custom (manual settings)
? Would you like to use a template? (Templates are Strapi configurations designed for a specific use case) (Y/n)
n
```

Select **mongo** from the list with the arrow keys and enter.

```
? Choose your installation type (Use arrow keys): Custom (manual settings)
? Would you like to use a template? (Templates are Strapi configurations designed for a specific use case) No
? Choose your default database client (Use arrow keys)
  sqlite
  postgres
  mysql
> mongo  
```

Select **MongoDB-Dev** for the database name (as we start with a development setup):

```
? Choose your installation type (Use arrow keys): Custom (manual settings)
? Would you like to use a template? (Templates are Strapi configurations designed for a specific use case) No
? Choose your default database client: mongo
? Database name: (cms) MongoDB-Dev
```

Enter **127.0.0.1** for a local database host (***Note***: adjust if your mongo database host for development runs at a different ip address):

```
? Choose your installation type (Use arrow keys): Custom (manual settings)
? Would you like to use a template? (Templates are Strapi configurations designed for a specific use case) No
? Choose your default database client: mongo
? Database name: MongoDB-Dev
? Host: (127.0.0.1) 127.0.0.1
```

Enter **false** for a + server connection:

```
? Choose your installation type (Use arrow keys): Custom (manual settings)
? Would you like to use a template? (Templates are Strapi configurations designed for a specific use case) No
? Choose your default database client: mongo
? Database name: MongoDB-Dev
? Host: 127.0.0.1
? +srv connection: (false) false
```

Enter **28016** for a the port of the mongo database host for development:

```
? Choose your installation type (Use arrow keys): Custom (manual settings)
? Would you like to use a template? (Templates are Strapi configurations designed for a specific use case) No
? Choose your default database client: mongo
? Database name: MongoDB-Dev
? Host: 127.0.0.1
? +srv connection: false
? Port (It will be ignored if you enable +srv): (27017) 28016
```

Enter **mongo_root** for a the mongo database host user name for development:

```
? Choose your installation type (Use arrow keys): Custom (manual settings)
? Would you like to use a template? (Templates are Strapi configurations designed for a specific use case) No
? Choose your default database client: mongo
? Database name: MongoDB-Dev
? Host: 127.0.0.1
? +srv connection: false
? Port (It will be ignored if you enable +srv): 28016
? Username: mongo_root
```

Enter **mongo_root()** for a the mongo database host user password for development:

```
? Choose your installation type (Use arrow keys): Custom (manual settings)
? Would you like to use a template? (Templates are Strapi configurations designed for a specific use case) No
? Choose your default database client: mongo
? Database name: MongoDB-Dev
? Host: 127.0.0.1
? +srv connection: false
? Port (It will be ignored if you enable +srv): 28016
? Username: mongo_root
? Password: mongo_root()
```

Enter **admin** for a the mongo authentication database for development:

```
? Choose your installation type (Use arrow keys): Custom (manual settings)
? Would you like to use a template? (Templates are Strapi configurations designed for a specific use case) No
? Choose your default database client: mongo
? Database name: MongoDB-Dev
? Host: 127.0.0.1
? +srv connection: false
? Port (It will be ignored if you enable +srv): 28016
? Username: mongo_root
? Password: mongo_root()
? Authentication database (Maybe "admin" or blank): admin
```

Enter **N** for No for enabling SSL connection with the mongo database for development:

```
? Choose your installation type (Use arrow keys): Custom (manual settings)
? Would you like to use a template? (Templates are Strapi configurations designed for a specific use case) No
? Choose your default database client: mongo
? Database name: MongoDB-Dev
? Host: 127.0.0.1
? +srv connection: false
? Port (It will be ignored if you enable +srv): 28016
? Username: mongo_root
? Password: mongo_root()
? Authentication database (Maybe "admin" or blank): admin
? Enable SSL connection: (y/N): N
```

You will be prompted as follows:

```
Creating a project with custom database options.
Creating a new Strapi application at /Users/willemvanheemstra/git/mongodb-headstart/containers/app/cms.
Creating files.
Dependencies installed successfully.

Your application was created at /Users/willemvanheemstra/git/mongodb-headstart/containers/app/cms.

Available commands in your project:

  yarn develop
  Start Strapi in watch mode.
  
  yarn start
  Start Strapi without watch mode.
  
  yarn build
  Build Strapi admin panel.
  
  yarn strapi
  Display all available commands.
  
You can start by doing:

  cd /Users/willemvanheemstra/git/mongodb-headstart/containers/app/cms
  yarn develop
  
Done in 2754.12s.  
```

Congratulations !!

Once all the Strapi dependencies are installed navigate to the ```cms``` folder and run ```yarn develop```:

```
$ cd containers/app/cms
$ yarn develop
```

Starting now, you should be able to visit the ```admin``` panel of your project: http://localhost:1337/admin.

Full Strapi Mongo instructions here:
https://strapi.io/documentation/3.0.0-beta.x/guides/databases.html#sqlite-installation

To start your Strapi server in the future, navigate to the ```cms``` folder and run ```yarn develop```:

```
$ cd containers/app/cms
$ yarn develop
```

### Create your first User

Add your first user from the registration page.

== WE ARE HERE ==
