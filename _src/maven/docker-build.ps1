# Docker Build and Run Script for Azure Application Insights Java Demo

Write-Host "🐳 Building Docker container for Azure Application Insights Java Demo..." -ForegroundColor Cyan

# Change to the script's directory
$scriptPath = Split-Path -Parent $MyInvocation.MyCommand.Definition
Set-Location $scriptPath

# Build the Docker image
docker build -t azure-appinsights-java-demo .

if ($LASTEXITCODE -eq 0) {
    Write-Host "✅ Docker image built successfully!" -ForegroundColor Green
    Write-Host ""
    Write-Host "🚀 To run the container:" -ForegroundColor Yellow
    Write-Host "docker run -p 8080:8080 azure-appinsights-java-demo" -ForegroundColor White
    Write-Host ""
    Write-Host "🔧 To run with Application Insights connection string:" -ForegroundColor Yellow
    Write-Host "docker run -p 8080:8080 -e `"APPLICATIONINSIGHTS_CONNECTION_STRING=your-connection-string`" azure-appinsights-java-demo" -ForegroundColor White
    Write-Host ""
    Write-Host "🌐 Application will be available at: http://localhost:8080" -ForegroundColor Magenta
    Write-Host ""
    Write-Host "📋 Quick start command:" -ForegroundColor Yellow
    Write-Host "docker run -d -p 8080:8080 --name appinsights-demo azure-appinsights-java-demo" -ForegroundColor White
} else {
    Write-Host "❌ Docker build failed!" -ForegroundColor Red
    exit 1
}
