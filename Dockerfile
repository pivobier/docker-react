FROM node:alpine
WORKDIR /app
COPY package*.json ./
RUN npm install 
COPY ./ ./
RUN ls -l ./
RUN ls -l build
CMD ["npm", "run" ,"build"]

FROM nginx
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html
RUN chmod -R +rx /usr/share/nginx/html  