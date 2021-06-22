FROM node:14 as build-stage

RUN npm install -g http-server
#WORKDIR /usr/src/app/frontend
WORKDIR /srv/www

COPY package*.json ./

RUN curl -fsSL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get install -y nodejs

RUN npm install

COPY . .

RUN npm run build

FROM nginx:stable-alpine as production-stage
COPY --from=build-stage /srv/www/dist /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
#EXPOSE 8080

#CMD ["npm", "run", "dev"]
#CMD ["http-server","dist"]
