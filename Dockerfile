# stage 1: build the website
FROM nginx AS builder
WORKDIR /website
COPY . .

# stage 2: serve the website
FROM nginx:alpine
RUN rm -rf /usr/share/nginx/html/*
COPY --from=builder /website /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]

