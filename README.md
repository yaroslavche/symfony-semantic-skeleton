### Install
Edit database connection string in `.env` file
```yaml
# .env
DATABASE_URL=mysql://db_user:db_password@127.0.0.1:3306/db_name
```
Run `install.sh` script
```
./install.sh --db
```

### Manual Install
#### Load vendor
```
composer install
```
#### Setup database
```
bin/console doctrine:database:create
bin/console doctrine:schema:create
```
#### Create user
```
bin/console doctrine:fixtures:load
```
or
```
bin/console fos:user:create username username@email.dev password --super-admin
```
#### Setup Semantic UI
```
yarn install
npm install semantic-ui
(cd semantic && gulp build)
yarn run encore dev
```
