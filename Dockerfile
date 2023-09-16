FROM openjdk:13-jdk-alpine as bas

WORKDIR /app
RUN addgroup -S waya && adduser -S waya -G waya
USER waya:waya

COPY build/libs/*.jar app.jar

ENTRYPOINT ["java", "-jar", "/app/app.jar"]
