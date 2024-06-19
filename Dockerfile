FROM adoptopenjdk/openjdk11
    
EXPOSE 8080
 
ENV APP_HOME /usr/src/app

COPY target/*.jar $APP_HOME/


WORKDIR $APP_HOME

CMD ["java", "-jar","$APP_HOME/app.jar"]
