## Start
-  Change user in `php/config/.gitconfig`
-  run docker-compose `docker-compose up`
-  if error with mysql, restart docker-compose
-  open new console linux

### MYSQL
- In a bash `docker exec -it mysql bash`
- In the mysql container
  -  `mysql -u root -p` (no secret)
  -  Show user : `select Host,User from mysql.user;`
  -  `ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'secret';`
  -  If not exist : `CREATE USER 'laravel'@'%' IDENTIFIED WITH mysql_native_password BY 'secret';`
  -  `GRANT ALL PRIVILEGES ON *.* TO 'laravel'@'%';`
  -  `FLUSH PRIVILEGES;`

### Apache
-  `docker exec -it web bash`
-  `cd /etc/apache2/sites-available`
-  `a2ensite appl.conf`
-  `service apache2 reload`

### Php
-  `docker exec -it php bash`
-  `cd /srv/www`
-  clone code `git clone https://github.com/... .`
-  if permission not good for `storage` : ` chmod -R a+w storage/`
-  `composer install`
-  `npm install`

### Develop
-  `npm run watch`: watch if js files change
#### Inside php container
-  Create database from laravel project: `php artisan migrate`
-  Refresh database (delete and create): `php artisan migrate:fresh`
-  Refresh database and populate: `php artisan migrate:fresh --seed`
-  Populate database: `php artisan db:seed`

### Open code
-  Inside VS Code `Attach to running container -> php`

### Access
  - `127.0.0.1:8080`

### Docker
-  `docker-compose up -d`
-  `docker exec -it php bash`
-  `docker container ls`
-  `docker container prune`
-  `docker system prune`

### Alias bash
-  `alias dcls='docker container ls --format "table {{.ID}}\t{{.Image}}\t{{.Names}}"'`
-  `alias dexec='docker exec -it'`