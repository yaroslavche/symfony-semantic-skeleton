#!/bin/bash

composer install

yarn install
npm install semantic-ui
(cd semantic && gulp build)
yarn run encore dev

withDatabase=false
while [ $# -gt 0 ]; do
    case "$1" in
        --db*)
            withDatabase=true
            ;;
        --test*)
            test="${1#*=}"
            ;;
        *)
            printf "Error: Invalid argument \"$1\"\n"
            exit 1
  esac
  shift
done

if [ "$withDatabase" = true ] ; then
    bin/console doctrine:database:create
    bin/console doctrine:schema:create
    bin/console doctrine:fixtures:load
fi
