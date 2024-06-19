# Stage 1: Build the application
FROM maven:3.8.5-openjdk-11 AS builder
WORKDIR /app
COPY . .
RUN mvn package

# Stage 2: Create the runtime image
FROM eclipse-temurin/openjdk-17-jre

# Define environment variables
ENV APP_HOME /usr/src/app

# Create directory for the application
RUN mkdir -p $APP_HOME

# Copy the JAR file from the builder stage to the runtime image
COPY --from=builder /app/target/*.jar $APP_HOME/app.jar

# Set the working directory
WORKDIR $APP_HOME

# Specify the command to run the application
CMD ["java", "-jar", "app.jar"]
