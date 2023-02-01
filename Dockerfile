FROM ubuntu:latest
RUN apt update -y && apt install nginx -y 
COPY . /var/www/html/
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]