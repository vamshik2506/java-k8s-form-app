# Use a Maven image to build the app
FROM maven:3.9.6-eclipse-temurin-17 AS build

# Set workdir and copy source code
WORKDIR /app
COPY pom.xml .
COPY src ./src

# Build the project
RUN mvn clean package -DskipTests

# Use a lightweight JDK base image to run the app
FROM eclipse-temurin:17-jdk-alpine

WORKDIR /app

# Copy the jar file from the build stage
COPY --from=build /app/target/formapp-1.0.0.jar app.jar

# Expose port and define entrypoint
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]

