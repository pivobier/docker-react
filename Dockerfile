FROM node:alpine AS build
WORKDIR /app
COPY package*.json ./
RUN npm install 
COPY ./ ./
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=build /app/build /usr/share/nginx/html
RUN chmod -R +rx /usr/share/nginx/html  