FROM eclipse-temurin:21-jdk-alpine

COPY ./Gestio-deployment-backend/gestio-1.0.2.jar . 

CMD ["java", "-jar", "gestio-1.0.2.jar"]
