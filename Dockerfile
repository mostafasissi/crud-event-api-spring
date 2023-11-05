FROM openjdk:19
EXPOSE 8080
ADD target/eventCrudApi.jar eventCrudApi.jar
ENTRYPOINT ["java" ,"-jar" , "/eventCrudApi.jar"]