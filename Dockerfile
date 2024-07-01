# Stage 1: Build the application
FROM maven:3.8.4-openjdk-17-slim AS build
WORKDIR /app

COPY pom.xml .
COPY src ./src

# Build the application without running tests to speed up the build
RUN mvn clean package -DskipTests

# Stage 2: Create the runtime image
FROM openjdk:17-slim
WORKDIR /app

COPY --from=build /app/target/*.jar app.jar

EXPOSE 21001
CMD ["java", "-jar", "app.jar"]
