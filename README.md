# Geomon IoT Portal - Docker achitecture
This repository creates the following 4 docker containers:

1. iot-portal-frontend
2. iot-portal-backend
3. iot-portal-db
4. web 

# Getting started

The necessary steps to mount and configure the docker environment to start developping are described below.

## Clone the current repository

Open Git bash into the path you want to clone the repository
```bash
git clone https://github.com/Infrasurvey/iot-portal-docker.git
cd iot-portal-docker
git checkout master
```

- _Note: be sure that your files are set to "LF" line breaks (not "CR/LF"). Otherwhise the docker compose will throw errors._

## Create the docker containers
To create the docker containers, open a terminal in the repository path and run the following command:
```bash
docker-compose up -d
```
This command will build the docker containers in detached mode.

## Configure the iot-portal-database container
Open the container in command line with:
```bash
docker exec -it iot-portal-database bash
```

Connect to mysql database with:
```bash
mysql -u root -p
```

- _Note 1: password = "secret"_
- _Note 2: password configured in ./iot-portal-docker/mysql/Dockerfile in `MYSQL_ROOT_PASSWORD` environment variable._

Grant all access to laravel user:
```sql
GRANT ALL PRIVILEGES ON *.* TO 'laravel'@'%';
FLUSH PRIVILEGES;
```
Exit mysql database with:

```bash
exit
```
Exit iot-portal-database container with:

```bash
exit
```

## Configure the web container
Open the container in command line with:
```bash
docker exec -it web bash
```

Configure hosted web pages with:
```bash
cd /etc/apache2/sites-available
a2ensite appl.conf
service apache2 reload
```

Exit web container with:

```bash
exit
```

## Configure the iot-portal-backend container
Open the container in command line with:
```bash
docker exec -it iot-portal-backend bash
```

Move to application folder with:
```bash
cd /srv/www
```

Clone iot-portal-backend git repository
```bash
git init .
git remote add -t \* -f origin https://github.com/Infrasurvey/iot-portal-backend.git
git checkout master
```

Modify permissions:
```bash
chmod -R a+w storage/
```

Copy content `.env.example` file to `.env` file
```bash
cp .env.example .env
```

Add SMTP server info in .env file by openning it with vi:
```bash
vi .env
```

Edit the following parameters/values by typing "i" to INSERT:
```
MAIL_MAILER=smtp
MAIL_HOST=smtp.sendgrid.net
MAIL_PORT=587
MAIL_USERNAME=apikey
MAIL_PASSWORD=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
MAIL_ENCRYPTION=tls
MAIL_FROM_NAME="Geomon"
MAIL_FROM_ADDRESS=geomon.iot@gmail.com
```

Save and close with `ESC` + `:wq`

Install dependies:
```bash
composer install
npm install
```

Migrate database:
```bash
php artisan migrate
```

Fetch Geomon data from FTP server:
```bash
php artisan geomon:fetch_ftp
```

Populate the database:
```bash
php artisan db:seed
```

Configure cache and application link:
```bash
php artisan optimize
php artisan storage:link
```

Modify user access permissions
```bash
chown -R www-data:www-data /srv/www/
```

Exit the container with:
```bash
exit
```

## Configure the iot-portal-frontend container
Open the container in command line with:
```bash
docker exec -it iot-portal-frontend bash
```

Move to application folder with:
```bash
cd /srv/www
```

Clone iot-portal-frontend git repository
```bash
git init .
git remote add -t \* -f origin https://github.com/Infrasurvey/iot-portal-frontend.git
git checkout main
```

Install dependencies with:
```bash
npm install
```

Run the frontend application with:
```bash
npm run dev
```