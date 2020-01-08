FROM openjdk:8-jdk-alpine
VOLUME /tmp
RUN ls & ls root & ls var
COPY /app.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]

