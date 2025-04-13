FROM eclipse-temurin:21-jdk as dev
WORKDIR /app
EXPOSE 8080
ENTRYPOINT ./mvnw spring-boot:run -DskipTest

FROM eclipse-temurin:21-jdk as prod
WORKDIR /app
EXPOSE 8080
COPY target/qualite-logicielle-0.0.1-SNAPSHOT.jar /app/target/
ENTRYPOINT java -jar target/qualite-logicielle-0.0.1-SNAPSHOT.jar