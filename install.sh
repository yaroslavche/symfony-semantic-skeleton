#!/bin/bash

withDatabase=false
withTest=false
while [ $# -gt 0 ]; do
    case "$1" in
        --db*)
            withDatabase=true
            ;;
        --test*)
            withTest=true
            ;;
        *)
            printf "Error: Invalid argument \"$1\"\n"
            exit 1
    esac
    shift
done


composer install

yarn install
npm install semantic-ui
(cd semantic && gulp build)
yarn run encore dev

if [ "$withDatabase" = true ] ; then
    bin/console doctrine:database:create
    bin/console doctrine:schema:create
    bin/console doctrine:fixtures:load
fi

if [ "$withTest" = true ] ; then
    bin/console server:start
    vendor/bin/behat
    bin/console server:stop
fi
