FROM ubuntu:latest
RUN apt update -y 
RUN apt install openjdk-11-jdk -y
ADD https://dlcdn.apache.org/tomcat/tomcat-8/v8.5.85/bin/apache-tomcat-8.5.85.tar.gz /opt
RUN ls /opt
WORKDIR /opt
RUN tar -xvzf apache-tomcat-8.5.85.tar.gz -C /opt
EXPOSE 8080
CMD ["/opt/apache-tomcat-8.5.85/bin/catalina.sh", "start"]