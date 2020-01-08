FROM openjdk:8-jdk-alpine
VOLUME /tmp
COPY /target/my-app-1.0-SNAPSHOT.jar app.jar
EXPOSE 8081
ENTRYPOINT ["java","-jar","/app.jar"]

