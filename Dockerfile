FROM openjdk:8-jdk-alpine
VOLUME /tmp
RUN pwd
RUN ls & ls /var/lib/docker/tmp/docker-builder118837027/
COPY /app.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]

