FROM openjdk:19-jre-slim

COPY gestio-1.0.1.jar . 

CMD ["java", "-jar", "gestio-1.0.1.jar"]