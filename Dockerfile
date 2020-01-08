FROM openjdk:8-jdk-alpine
VOLUME /tmp
COPY /var/jenkins_home/workspace/simple-java-maven-app/target/my-app-1.0-SNAPSHOT.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]

