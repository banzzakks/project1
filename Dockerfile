FROM openjdk:latest

COPY  ./target/spring-petclinic-2.3.0.BUILD-SNAPSHOT.jar app.jar
WORKDIR /root
VOLUME ["/data/","/var/log/"]
RUN groupadd -r -g 1000 usera && useradd -r -g 1000 -u 1000 usera
USER usera
EXPOSE 80 
ENTRYPOINT ["java","-jar","/app.jar"]
