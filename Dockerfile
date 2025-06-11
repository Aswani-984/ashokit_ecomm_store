FROM node:18 AS build

WORKDIR /app

COPY package*.json ./

RUN npm install --verbose

COPY . .

RUN npm run build --prod -- --base-href /ashokitecommstore/

FROM nginx:alpine

COPY --from=build /app/dist/ecommerce_frontend /usr/share/nginx/html/ashokitecommstore

COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80
