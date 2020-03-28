FROM tomcat:8.0-alpine

RUN jar -cvf swe645.war /Source/*
ADD swe645.war /usr/local/tomcat/webapps/

EXPOSE 5000
CMD ["catalina.sh", "run"]
