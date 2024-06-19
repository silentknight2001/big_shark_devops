FROM adoptopenjdk/openjdk11

# Expose the application port
EXPOSE 8080

# Set the application home directory
ENV APP_HOME /usr/src/app

# Create the application home directory
RUN mkdir -p $APP_HOME

# Copy the JAR file(s) from the target directory to the application home directory
COPY target/*.jar $APP_HOME/

# Set the working directory
WORKDIR $APP_HOME

# Specify the command to run the application
CMD ["java", "-jar", "$(ls $APP_HOME/*.jar)"]
