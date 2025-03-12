PRIVATE_IP $1

echo "spring.application.name=gestioBackEnd

server.error.include-message=always
server.error.include-binding-errors=always

spring.datasource.url=jdbc:mysql://localhost:3306/askyu
spring.datasource.driver-class-name=com.mysql.cj.jdbc.Driver
spring.datasource.username=testes
spring.datasource.password=12345678

spring.jpa.show-sql=true
spring.jpa.properties.hibernate.format_sql=true
spring.jpa.hibernate.ddl-auto=update

spring.servlet.multipart.enabled=true
spring.servlet.multipart.max-file-size=10MB
spring.servlet.multipart.max-request-size=10MB
cors.allowed-origins=${PRIVATE_IP}" > ./application.properties

sudo apt update -y
sudo apt upgrade -y

git clone https://github.com/AskyuConsultoria/Gestio-back-api.git
git clone https://github.com/AskyuConsultoria/Gestio-deployment-backend.git

curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

sudo docker network create backnet

sudo docker build -t mysql-image -f mysql.dockerfile ./Gestio-deployment-backend/mysql.dockerfile .
sudo docker run --name mysql-container --network backnet -d -p 3306:3306 mysql-image 

sudo docker build -t backend-image -f backend.dockerfile ./Gestio-deployment-backend/backend.dockerfile .
sudo docker run --name backend-container --network backnet -e SPRING_DATASOURCE_URL=jdbc:mysql://mysql-container:3306/askyu -d -p 8080:8080 backend-image 
