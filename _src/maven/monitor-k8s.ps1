# Kubernetes Monitoring Script for Azure Application Insights Java Demo

Write-Host "📊 Monitoring Azure Application Insights Java Demo in Kubernetes..." -ForegroundColor Cyan

# Check if deployment exists
$deploymentExists = kubectl get deployment azure-appinsights-java-demo -n appinsightdemo --ignore-not-found=true 2>$null

if (-not $deploymentExists) {
    Write-Host "❌ Deployment not found in 'appinsightdemo' namespace" -ForegroundColor Red
    Write-Host "💡 Run .\deploy-k8s.ps1 to deploy the application first" -ForegroundColor Yellow
    exit 1
}

Write-Host "🎯 Current Status:" -ForegroundColor Yellow
Write-Host ""

# Show deployment status
Write-Host "📋 Deployment Status:" -ForegroundColor White
kubectl get deployment -n appinsightdemo

Write-Host ""
Write-Host "🏃 Pods Status:" -ForegroundColor White
kubectl get pods -n appinsightdemo

Write-Host ""
Write-Host "🌐 Service Status:" -ForegroundColor White
kubectl get services -n appinsightdemo

Write-Host ""
Write-Host "📈 Resource Usage:" -ForegroundColor White
kubectl top pods -n appinsightdemo 2>$null

Write-Host ""
Write-Host "📜 Recent Events:" -ForegroundColor White
kubectl get events -n appinsightdemo --sort-by=.metadata.creationTimestamp | Select-Object -Last 5

Write-Host ""
Write-Host "🔗 Quick Actions:" -ForegroundColor Yellow
Write-Host "   View logs: kubectl logs -n appinsightdemo deployment/azure-appinsights-java-demo -f" -ForegroundColor White
Write-Host "   Port forward: kubectl port-forward -n appinsightdemo service/azure-appinsights-java-demo-service 8080:80" -ForegroundColor White
Write-Host "   Scale up: kubectl scale deployment azure-appinsights-java-demo --replicas=3 -n appinsightdemo" -ForegroundColor White
Write-Host "   Scale down: kubectl scale deployment azure-appinsights-java-demo --replicas=1 -n appinsightdemo" -ForegroundColor White