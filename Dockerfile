FROM openjdk:8-jdk-alpine
VOLUME /tmp
CMD ls
CMD ls root
CMD ls var
COPY /app.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]

