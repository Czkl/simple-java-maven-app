FROM openjdk:8-jdk-alpine
VOLUME /tmp
COPY target/simple-java-maven-app.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]

