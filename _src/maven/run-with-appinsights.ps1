# Set your Application Insights connection string
$env:APPLICATIONINSIGHTS_CONNECTION_STRING = "InstrumentationKey=8a3054d4-0f22-466d-abc8-fbeb45d6a104;IngestionEndpoint=https://australiaeast-1.in.applicationinsights.azure.com/;LiveEndpoint=https://australiaeast.livediagnostics.monitor.azure.com/;ApplicationId=0568e94c-8c3e-4d1a-a3b1-1e2c4314cd2d"

# Set Java Home
$env:JAVA_HOME = "C:\Users\asifkhan\.jdk\jdk-21.0.8"

# Navigate to the maven directory
Set-Location -Path "c:\Users\asifkhan\Downloads\ApplicationInsights-Java\maven"

# Build the application first
Write-Host "Building the application..." -ForegroundColor Green
& "$env:JAVA_HOME\bin\java.exe" -version
..\mvnw.cmd clean package -DskipTests

if ($LASTEXITCODE -eq 0) {
    Write-Host "Build successful! Starting application with Application Insights..." -ForegroundColor Green
    Write-Host "Application will be available at: http://localhost:8082" -ForegroundColor Cyan
    
    # Run the application with Application Insights Java agent
    & "$env:JAVA_HOME\bin\java.exe" -javaagent:target/agent/applicationinsights-agent.jar -jar target/app.jar --server.port=8082
} else {
    Write-Host "Build failed!" -ForegroundColor Red
}