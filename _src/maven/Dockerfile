# Use Maven image for building, then Eclipse Temurin for runtime
FROM maven:3.9-eclipse-temurin-21 AS builder

# Set working directory
WORKDIR /app

# Copy pom.xml and source code
COPY pom.xml ./
COPY src ./src

# Build the application
RUN mvn clean package -DskipTests

# Create agent directory and copy existing Application Insights agent from local folder
RUN mkdir -p agent
COPY applicationinsights-agent-3.7.4.jar agent/applicationinsights-agent.jar

# Runtime stage - use Eclipse Temurin JRE
FROM eclipse-temurin:21-jre-jammy

# Set working directory
WORKDIR /app

# Copy built JAR and agent from builder stage
COPY --from=builder /app/target/app.jar ./
COPY --from=builder /app/agent/applicationinsights-agent.jar ./agent/

# Expose port 8082
EXPOSE 8082

# Set environment variables for Application Insights (can be overridden at runtime)
ENV APPLICATIONINSIGHTS_CONNECTION_STRING=""
ENV JAVA_OPTS="-Xms256m -Xmx512m"

# Run the application with conditional Application Insights agent
CMD ["sh", "-c", "if [ -f agent/applicationinsights-agent.jar ]; then java $JAVA_OPTS -javaagent:agent/applicationinsights-agent.jar -jar app.jar; else echo 'Running without Application Insights agent'; java $JAVA_OPTS -jar app.jar; fi"]