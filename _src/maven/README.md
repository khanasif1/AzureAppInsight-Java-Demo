# Basic example

To run, from this directory:

```
../mvnw package
export "APPLICATIONINSIGHTS_CONNECTION_STRING=<Copy connection string from Application Insights Resource Overview>"
java -javaagent:target/agent/applicationinsights-agent.jar -jar target/app.jar
```


# Set environment
cd "C:\_code\personal_github\AzureAppInsight-Java-Demo\_src\maven"
$env:JAVA_HOME = "C:\Program Files\Java\jdk-25"
$env:PATH = "$env:JAVA_HOME\bin;" + $env:PATH

# Build
..\mvnw.cmd clean package -DskipTests


# Run the code locally

cd "C:\_code\personal_github\AzureAppInsight-Java-Demo\_src\maven"

$env:JAVA_HOME = "C:\Program Files\Java\jdk-25"
$env:PATH = "$env:JAVA_HOME\bin;" + $env:PATH


## Manual Download (Recommended)
- Open your web browser
- Go to: https://github.com/microsoft/ApplicationInsights-Java/releases
- Download: applicationinsights-agent.jar (latest version)
- Save it to: maven

Then run:

cd "C:\_code\personal_github\AzureAppInsight-Java-Demo\_src\maven"
java -javaagent:applicationinsights-agent-3.7.4.jar -jar target\app.jar

# Docker Container Build and Run

## Build Docker Image

### On Windows (PowerShell):
```powershell
.\docker-build.ps1
```

### On Linux/Mac (Bash):
```bash
chmod +x docker-build.sh
./docker-build.sh
```

### Manual Docker Commands:

```bash
# Build the image
docker build -t azure-appinsights-java-demo .

# Run without Application Insights
docker run -p 8080:8080 azure-appinsights-java-demo

# Run with Application Insights (replace with your connection string)
docker run -p 8080:8080 -e "APPLICATIONINSIGHTS_CONNECTION_STRING=your-connection-string" azure-appinsights-java-demo

# Run in background
docker run -d -p 8080:8080 --name appinsights-demo azure-appinsights-java-demo
```

## Access Application
- Web UI: http://localhost:8080
- API Endpoints: http://localhost:8080/api     