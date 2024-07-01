# Stage 1: Build the application
FROM maven:3.8.4-openjdk-17-slim AS build
WORKDIR /app

# Copy the pom.xml first to leverage Docker cache
COPY pom.xml .
# Copy your source files
COPY src src

# Build the application without running tests to speed up the build
RUN mvn clean package -DskipTests

# Stage 2: Create the runtime image
FROM openjdk:17-slim
WORKDIR /app

# Use the argument in the COPY command
ARG JAR_FILE
COPY ${JAR_FILE} app.jar

EXPOSE 8080
CMD ["java", "-jar", "app.jar"]
