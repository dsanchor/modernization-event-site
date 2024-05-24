FROM node:alpine

WORKDIR /app

COPY . .

RUN npm install 

RUN npm run build --prod

FROM nginx:alpine

COPY --from=node /app/dist/modernization-event-site /usr/share/nginx/html