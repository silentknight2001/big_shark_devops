# Stage 1: Build the application (can be your existing project directory)
FROM maven:3.8.5-openjdk-11 AS builder
WORKDIR /app
COPY . .
RUN mvn package

# Stage 2: Create the runtime image (slimmer base image)
FROM eclipse-temurin/openjdk-17-jre

# Copy only the JAR from the build stage
COPY --from=builder /app/target/*.jar $APP_HOME/

# Rest of your Dockerfile remains the same (ENV, WORKDIR, CMD)
ENV APP_HOME /usr/src/app

WORKDIR $APP_HOME

CMD ["java", "-jar", "app.jar"]
