# FROM node:18-alpine as builder
# WORKDIR '/app'
# COPY package.json .
# RUN npm install
# COPY . . 
# RUN npm run build


# FROM nginx
# COPY --from=builder /app/build /user/share/nginx/html


FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html