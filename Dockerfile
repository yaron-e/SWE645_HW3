FROM tomcat:8.0-alpine
LABEL maintainer="deepak@softwareyoga.com"

ADD swe645.war /usr/local/tomcat/webapps/

EXPOSE 5000
CMD ["catalina.sh", "run"]
