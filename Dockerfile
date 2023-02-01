FROM ubuntu:latest
RUN apt update -y && apt install nginx -y 
COPY index.html /usr/share/nginx/html/index.html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]