FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build
# /app/build <----- all the stuff we care about

# COPY --from=builder  <------ kopiraj iz neke faze
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
# default komanda nginx image je startanje pa ne treba dodati komandu