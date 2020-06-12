FROM node:12.18.0-alpine3.12 as builder

WORKDIR '/app'

COPY package.json .

RUN npm install

COPY . .

RUN npm run build

FROM nginx
#For AWS EXPOSE is needed
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
