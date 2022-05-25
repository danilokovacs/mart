FROM openjdk:11
WORKDIR /mart/
COPY projeto-mart-cli.jar /mart/
CMD ["java","-jar","projeto-mart-cli.jar"]