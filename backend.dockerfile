FROM azul/zulu-openjdk-alpine:21

COPY gestio-1.0.1.jar . 

CMD ["java", "-jar", "gestio-1.0.1.jar"]