FROM openjdk:8-jdk-alpine
VOLUME /tmp
COPY ./build/libs/example.jar /app.jar

CMD java -jar app.jar --server.port=$PORT
