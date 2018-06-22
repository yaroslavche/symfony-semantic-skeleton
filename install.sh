composer install
bin/console doctrine:database:create
bin/console doctrine:schema:create
bin/console doctrine:fixtures:load
yarn install
npm install semantic-ui
(cd semantic && gulp build)
yarn run encore dev
