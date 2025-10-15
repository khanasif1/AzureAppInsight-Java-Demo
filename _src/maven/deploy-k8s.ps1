# Kubernetes Deployment Script for Azure Application Insights Java Demo

Write-Host "🚀 Deploying Azure Application Insights Java Demo to Kubernetes..." -ForegroundColor Cyan

# Check if kubectl is available
try {
    kubectl version --client --short | Out-Null
    Write-Host "✅ kubectl is available" -ForegroundColor Green
} catch {
    Write-Host "❌ kubectl is not available. Please install kubectl first." -ForegroundColor Red
    exit 1
}

Write-Host ""
Write-Host "📋 Deployment Steps:" -ForegroundColor Yellow

# Step 1: Create namespace and ConfigMap/Secret
Write-Host "1️⃣ Creating namespace and configuration..." -ForegroundColor White
kubectl create namespace appinsightdemo
kubectl apply -f k8s-config.yaml

if ($LASTEXITCODE -eq 0) {
    Write-Host "   ✅ Namespace and config created successfully" -ForegroundColor Green
} else {
    Write-Host "   ❌ Failed to create namespace and config" -ForegroundColor Red
    exit 1
}

# Step 2: Deploy the application
Write-Host "2️⃣ Deploying application..." -ForegroundColor White
kubectl apply -f k8s-deployment.yaml

if ($LASTEXITCODE -eq 0) {
    Write-Host "   ✅ Application deployed successfully" -ForegroundColor Green
} else {
    Write-Host "   ❌ Failed to deploy application" -ForegroundColor Red
    exit 1
}

Write-Host ""
Write-Host "🎯 Checking deployment status..." -ForegroundColor Cyan
kubectl get pods -n appinsightdemo
kubectl get services -n appinsightdemo

Write-Host ""
Write-Host "📖 Useful commands:" -ForegroundColor Yellow
Write-Host "   View pods: kubectl get pods -n appinsightdemo" -ForegroundColor White
Write-Host "   View services: kubectl get services -n appinsightdemo" -ForegroundColor White
Write-Host "   View logs: kubectl logs -n appinsightdemo deployment/azure-appinsights-java-demo" -ForegroundColor White
Write-Host "   Port forward: kubectl port-forward -n appinsightdemo service/azure-appinsights-java-demo-service 8080:80" -ForegroundColor White
Write-Host "   Delete deployment: kubectl delete namespace appinsightdemo" -ForegroundColor White

Write-Host ""
Write-Host "🌐 To access the application:" -ForegroundColor Magenta
Write-Host "   Run: kubectl port-forward -n appinsightdemo service/azure-appinsights-java-demo-service 8080:80" -ForegroundColor White
Write-Host "   Then open: http://localhost:8080" -ForegroundColor White