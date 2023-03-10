FROM ubuntu:latest
RUN apt-get -y update && apt-get -y upgrade
RUN apt-get -y install openjdk-8-jdk wget
RUN mkdir /usr/local/tomcat
RUN wget https://dlcdn.apache.org/tomcat/tomcat-8/v8.5.85/bin/apache-tomcat-8.5.85.tar.gz -O /tmp/tomcat.tar.gz
RUN cd /tmp && tar xvfz tomcat.tar.gz
RUN cp -Rv /tmp/apache-tomcat-8.5.85/* /usr/local/tomcat/
RUN ls /usr/local/tomcat/
RUN wget https://s3-us-west-2.amazonaws.com/studentapi-cit/student.war
RUN cp -Rv student.war /usr/local/tomcat/webapps/
RUN wget https://s3-us-west-2.amazonaws.com/studentapi-cit/mysql-connector.jar
RUN cp -Rv mysql-connector.jar /usr/local/tomcat/lib/
RUN sed -n '21,24p' data.txt >> /usr/local/tomcat/conf/context.xml
EXPOSE 8080
CMD /usr/local/tomcat/bin/catalina.sh run



# FROM ubuntu:latest
# RUN apt update -y 
# RUN apt install openjdk-11-jdk -y
# ADD https://dlcdn.apache.org/tomcat/tomcat-8/v8.5.85/bin/apache-tomcat-8.5.85.tar.gz /opt
# RUN ls /opt
# WORKDIR /opt
# RUN tar -xvzf apache-tomcat-8.5.85.tar.gz -C /opt
# EXPOSE 8080
# CMD ["/opt/apache-tomcat-8.5.85/bin/catalina.sh", "start"]
