# build
FROM node:20-alpine AS node
WORKDIR /app
COPY . .
RUN npm install 
RUN npm run build --prod
# run
FROM nginxinc/nginx-unprivileged
COPY --from=node /app/dist/modernization-event-site/browser /usr/share/nginx/html