FROM nginx:alpine
COPY index.html /usr/share/nginx/html/index.html
WORKDIR /app
EXPOSE 80
