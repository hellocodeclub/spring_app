FROM maven:3.6.3-openjdk-15 as builder

WORKDIR app
COPY pom.xml .
COPY src ./src

RUN mvn package -DskipTests

FROM openjdk:15-alpine

COPY --from=builder /app/target/imgarena-app-1.0-SNAPSHOT.jar /imgarena-app.jar

CMD ["java","-jar","/imgarena-app.jar"]