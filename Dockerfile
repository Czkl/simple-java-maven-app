FROM openjdk:8-jdk-alpine
VOLUME /tmp
COPY /app.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]

