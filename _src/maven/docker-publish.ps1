param([string]$DockerHubUsername)

Write-Host "Publishing to Docker Hub..." -ForegroundColor Cyan

if (-not $DockerHubUsername) {
    $DockerHubUsername = Read-Host "Enter your Docker Hub username"
}

$tag = "$DockerHubUsername/azure-appinsights-java-demo:latest"
Write-Host "Tagging image as $tag..." -ForegroundColor Yellow

docker tag azure-appinsights-java-demo $tag
if ($LASTEXITCODE -eq 0) {
    Write-Host "Image tagged successfully!" -ForegroundColor Green
    Write-Host "Pushing to Docker Hub..." -ForegroundColor Yellow
    docker push $tag
    if ($LASTEXITCODE -eq 0) {
        Write-Host "Successfully published!" -ForegroundColor Green
        Write-Host "Pull: docker pull $tag" -ForegroundColor White
        Write-Host "Run: docker run -p 8080:8082 $tag" -ForegroundColor White
    } else {
        Write-Host "Push failed! Login: docker login" -ForegroundColor Red
    }
} else {
    Write-Host "Tag failed!" -ForegroundColor Red
}
