FROM openjdk:8-jdk
RUN apt-get update -y
RUN apt-get install -y maven
COPY RiskMeter /usr/local/service/RiskMeter
WORKDIR /usr/local/service/RiskMeter
RUN mvn package

