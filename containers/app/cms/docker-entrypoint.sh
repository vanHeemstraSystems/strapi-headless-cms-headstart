#!/bin/sh
set -ea

if [ "$1" = "strapi" ]; then

  if [ ! -f "package.json" ]; then

    DATABASE_CLIENT=${DATABASE_CLIENT:-sqlite}

    EXTRA_ARGS=${EXTRA_ARGS}

    echo "Using strapi $(strapi version)"

    echo "No project found at /srv/app. Creating a new strapi project."

    DOCKER=true strapi new . \
      --dbclient=$DATABASE_CLIENT \
      --dbhost=$DATABASE_HOST \
      --dbport=$DATABASE_PORT \
      --dbname=$DATABASE_NAME \
      --dbusername=$DATABASE_USERNAME \
      --dbpassword=$DATABASE_PASSWORD \
      --dbssl=$DATABASE_SSL \
      $EXTRA_ARGS

  elif [ ! -d "node_modules" ] || [ ! "$(ls -qAL node_modules 2>/dev/null)" ]; then

    echo "Node modules not installed. Installing..."

    # custom code required
    # see also: https://github.com/lovell/sharp/issues/2498
    # see also: https://github.com/libvips/libvips/issues/1142
    apk add --update python3 py3-pip make g++ vips-dev fftw-dev build-base --no-cache \
            --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community \
            --repository=http://dl-cdn.alpinelinux.org/alpine/edge/main 

    if [ -f "yarn.lock" ]; then

       echo "Found yarn.lock, using yarn install --unsafe-perm"

       # See also https://stackoverflow.com/questions/54409953/cant-install-sharp
       yarn install --unsafe-perm

    else   

       echo "No yarn.lock found, using npm install --unsafe-perm"

       npm install sharp --unsafe-perm

       # See also https://stackoverflow.com/questions/54409953/cant-install-sharp
       npm install --unsafe-perm

    fi

  fi

fi

echo "Starting your awesome strapi app..."

exec "$@"
