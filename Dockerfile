FROM node:alpine AS builder
WORKDIR '/app'
COPY package.json .
RUN npm install 
COPY . .
CMD ["npm", "run" ,"build"]

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
RUN chmod -R +rx /usr/share/nginx/html