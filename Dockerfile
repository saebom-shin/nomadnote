# Multi-stage Dockerfile for Spring Boot application
FROM maven:3.9.4-eclipse-temurin-17 as build
WORKDIR /workspace
COPY pom.xml .
COPY src ./src
# Ensure an executable Spring Boot jar is created
RUN mvn -B -DskipTests package spring-boot:repackage

FROM eclipse-temurin:17-jdk-jammy
WORKDIR /app
COPY --from=build /workspace/target/calculator-0.0.1-SNAPSHOT.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/app/app.jar"]
