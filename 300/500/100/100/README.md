# 100 - Service Setup

## 100 - Install Create React App globally

```
$ npm install -g create-react-app@3.4.1
```

## 200 - Setup the directory structure

Not applicable

## 300 - Generate a new app

### Next

To set up [Next.js](https://strapi.io/integrations/nextjs-cms) we will need an empty directory to install the library and host our project root.

We will split our project into two parts, one for the front end (Next.js code) and one for the backend (Strapi code).

***Note***: We will actually install **only** the **backend (Strapi code)** here, as the front end will be installed in https://github.com/vanHeemstraSystems/strapi-head-of-cms-headstart.

***Note***: I am using the current versions of all packages as of the time of writing May 2020. Locking these versions will ensure compatibility in the future. Should you use the current versions of these packages, you may need to update the code according to the documentation of the appropriate package. Upgrade packages at your own will.

Create your project folders and install the current versions of next 9.4.0, react 16.13.1, and react-dom 16.13.1





== WE ARE HERE ==

Inside the subdirectory /containers/app/ created a new app called '***cms***':

```
$ cd containers/app
$ npm init react-app cms --use-npm
$ cd cms
```
