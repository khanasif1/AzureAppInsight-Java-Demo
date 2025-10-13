# Application Insights Java Sample - Upgraded to Java 21 & Spring Boot 3.4.0

This repository demonstrates how to integrate Application Insights with a Java Spring Boot application, upgraded to the latest LTS Java version (21) and latest Spring Boot version (3.4.0).

## 🚀 Quick Start

### Prerequisites
- Java 21 (JDK 21.0.8 or later)
- Maven 3.9+ (Maven wrapper included)
- Azure Application Insights resource

### Running the Application

1. **Clone and navigate to the project:**
   ```bash
   cd maven
   ```

2. **Run the application:**
   ```powershell
   .\run-with-appinsights.ps1
   ```

3. **Access the application:**
   - **Main endpoint**: http://localhost:8082/
   - **Test endpoint**: http://localhost:8082/test
   - **Health endpoint**: http://localhost:8082/health
   - **Error endpoint**: http://localhost:8082/error (for testing exception tracking)

## 📊 Application Insights Configuration

The application is configured to send telemetry to Azure Application Insights with the following features:

- **Automatic request tracking**
- **Exception tracking**
- **Performance metrics**
- **Custom logging**
- **Dependency tracking**

### Configuration Details
- **Connection String**: Configured in `run-with-appinsights.ps1`
- **Role Name**: `maven-spring-boot-app`
- **Sampling**: 100% (for development)
- **Logging Level**: INFO

## 🔧 Project Structure

```
maven/
├── src/main/java/com/example/
│   ├── ExampleApplication.java      # Main Spring Boot application
│   └── ExampleController.java       # REST endpoints with telemetry
├── src/main/resources/
│   └── applicationinsights.json     # Application Insights configuration
├── pom.xml                         # Maven dependencies
└── run-with-appinsights.ps1        # Startup script
```

## 🆙 Upgrade Details

This project has been upgraded from:
- **Java 8** → **Java 21** (Latest LTS)
- **Spring Boot 2.7.18** → **Spring Boot 3.4.0** (Latest)

### Upgrade Process
1. Used OpenRewrite recipes for automated migration
2. Milestone-based approach (Java 8→21 + Spring Boot 2.7→3.3, then 3.3→3.4)
3. Full validation including CVE checks, behavior validation, and tests
4. No breaking changes to existing functionality

## 🛠 Available Build Commands

### Using Maven Wrapper (Recommended)
```bash
# Build the application
..\mvnw.cmd clean package

# Run tests
..\mvnw.cmd test

# Clean build artifacts
..\mvnw.cmd clean
```

### Manual Java Commands
```bash
# Set environment variables
$env:JAVA_HOME = "C:\Users\asifkhan\.jdk\jdk-21.0.8"
$env:APPLICATIONINSIGHTS_CONNECTION_STRING = "your-connection-string"

# Build manually
& "$env:JAVA_HOME\bin\java.exe" -javaagent:target/agent/applicationinsights-agent.jar -jar target/app.jar
```

## 📈 Monitoring in Azure

After running the application, you can monitor it in your Azure Application Insights dashboard:

1. **Live Metrics Stream**: Real-time telemetry
2. **Application Map**: Service dependencies
3. **Performance**: Response times and throughput
4. **Failures**: Exception tracking and error rates
5. **Logs**: Custom application logs

## 🔍 Testing Telemetry

Visit these endpoints to generate telemetry data:

- `GET /` - Basic request tracking
- `GET /test` - Request with simulated processing time
- `GET /health` - Health check logging
- `GET /error` - Exception tracking (throws test exception)

## 🏗 Architecture

- **Java Runtime**: OpenJDK 21.0.8 (Microsoft distribution)
- **Framework**: Spring Boot 3.4.0
- **Application Insights Agent**: 3.7.5
- **Telemetry**: Automatic instrumentation via Java agent
- **Build Tool**: Maven 3.9.11 (via wrapper)

## 📝 Notes

- The application runs on port 8082 by default
- Application Insights connection string is configured via environment variable
- All telemetry data is sent to the configured Azure Application Insights instance
- Build artifacts are automatically cleaned up for a cleaner project structure

---

## Trademarks

This project may contain trademarks or logos for projects, products, or services. Authorized use of Microsoft trademarks or logos is subject to and must follow Microsoft's Trademark & Brand Guidelines. Use of Microsoft trademarks or logos in modified versions of this project must not cause confusion or imply Microsoft sponsorship. Any use of third-party trademarks or logos are subject to those third-party's policies.lication Insights Java Samples

# Trademarks

This project may contain trademarks or logos for projects, products, or services. Authorized use of Microsoft trademarks or logos is subject to and must follow Microsoft’s Trademark & Brand Guidelines. Use of Microsoft trademarks or logos in modified versions of this project must not cause confusion or imply Microsoft sponsorship. Any use of third-party trademarks or logos are subject to those third-party’s policies.
