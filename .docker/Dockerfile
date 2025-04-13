FROM maven:3.9.9-eclipse-temurin-21-jdk as build-prod
COPY . .
RUN mvn clean package


FROM eclipse-temurin:21-jdk as prod



COPY . .