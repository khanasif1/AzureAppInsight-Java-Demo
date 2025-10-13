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