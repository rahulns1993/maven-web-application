FROM tomcat:8.0.15-jre8
COPY target/maven-web-application*.war /usr/local/tomcat/webapps/maven-web-application.war