# Stage 1: Build the application
FROM maven:3.8-eclipse-temurin-17 AS builder
WORKDIR /src
COPY . .
RUN mvn clean package -DskipTests

# Stage 2: Run the application
FROM eclipse-temurin:17-jdk-alpine
COPY --from=builder /src/target/*.jar /app/bankapp.jar
WORKDIR /app
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "bankapp.jar"]
