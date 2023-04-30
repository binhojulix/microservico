FROM bellsoft/liberica-openjdk-alpine-musl:17

WORKDIR /app

# Copy the Spring Batch application JAR file
COPY target/batch-processing-complete-0.0.1-SNAPSHOT.jar .

# Expose the Spring Batch server port
EXPOSE 8080

# Run the Spring Batch application
CMD ["java", "-jar", "batch-processing-complete-0.0.1-SNAPSHOT.jar"]
