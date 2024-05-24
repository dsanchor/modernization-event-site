# build
FROM node:20-alpine AS node
WORKDIR /app
COPY . .
RUN npm install 
RUN npm run build --prod
# run
FROM nginx:alpine
COPY --from=node /app/dist/modernization-event-site /usr/share/nginx/html