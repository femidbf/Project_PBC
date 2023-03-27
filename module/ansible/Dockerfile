FROM openjdk:8
ADD spring-petclinic-2.4.2.war /app
ADD newrelic.jar  /app
ADD newrelic.yml  /app 
ENV NEW_RELIC_APP_NAME="pet-bank-femi"
ENV NEW_RELIC_LICENSE_KEY="eu01xx7c0963548bf7c1e0573aa71a97340aNRAL"
ENV NEW_RELIC_LOG_FILE_NAME="STDOUT"
ENTRYPOINT ["java","-javaagent:/app/newrelic.jar","-jar","spring-petclinic-2.4.2.war","--server.port=8085"]