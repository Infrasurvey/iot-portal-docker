FROM node:14-bullseye

WORKDIR /srv/www/

RUN apt-get update &&\
    apt-get install -y git

COPY .bashrc /root/.bashrc
COPY .gitconfig /root/.gitconfig

EXPOSE 8080
    # npm install -g http-server &&\
    # curl -fsSL https://deb.nodesource.com/setup_14.x | bash -

# RUN npm install

# COPY . .
# RUN npm run build

# FROM nginx:stable-alpine as production-stage
# COPY --from=build-stage /srv/www/dist /usr/share/nginx/html
# EXPOSE 80
# CMD ["nginx", "-g", "daemon off;"]

# CMD ["npm", "run", "dev"]
# CMD ["http-server","dist"]