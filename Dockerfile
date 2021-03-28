# Base image
FROM node:alpine as builder
# Work directory
WORKDIR /app
COPY package.json .
RUN yarn
COPY . .
RUN yarn build

# Start Nginx
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html