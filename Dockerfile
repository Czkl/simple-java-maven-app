FROM openjdk:8-jdk-alpine
VOLUME /tmp
RUN ls
COPY /app.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]

