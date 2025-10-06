# ComfySharp Package Build Script
# Builds packages in dependency order and installs them locally

Write-Host "ComfySharp Package Build Script" -ForegroundColor Green
Write-Host "=================================" -ForegroundColor Green
Write-Host ""

# Ensure all submodules are up to date
Write-Host "Updating submodules..." -ForegroundColor Yellow
git submodule update --init --recursive
if ($LASTEXITCODE -ne 0) {
    Write-Host "Warning: Could not update submodules" -ForegroundColor Yellow
}

# Clean previous builds
Write-Host "Cleaning previous builds..." -ForegroundColor Yellow
dotnet clean
if (Test-Path "packages") {
    Remove-Item -Recurse -Force "packages"
}

# Create packages directory
New-Item -ItemType Directory -Force -Path "packages"

# Build and pack in dependency order
Write-Host "Building packages in dependency order..." -ForegroundColor Yellow
Write-Host ""

# 1. Build and pack ComfySharp (base package)
Write-Host "1. Building ComfySharp (base package)..." -ForegroundColor Cyan
dotnet build ComfySharp/ComfySharp/ComfySharp.csproj --configuration Release
if ($LASTEXITCODE -ne 0) {
    Write-Host "Failed to build ComfySharp!" -ForegroundColor Red
    exit 1
}

dotnet pack ComfySharp/ComfySharp/ComfySharp.csproj --configuration Release --output packages --no-build
if ($LASTEXITCODE -ne 0) {
    Write-Host "Failed to pack ComfySharp!" -ForegroundColor Red
    exit 1
}

Write-Host "✓ ComfySharp package created" -ForegroundColor Green
Write-Host ""

# 2. Build and pack ComfySharp.Extensions
Write-Host "2. Building ComfySharp.Extensions..." -ForegroundColor Cyan
dotnet build ComfySharp.Extensions/ComfySharp.Extensions/ComfySharp.Extensions.csproj --configuration Release
if ($LASTEXITCODE -ne 0) {
    Write-Host "Failed to build ComfySharp.Extensions!" -ForegroundColor Red
    exit 1
}

dotnet pack ComfySharp.Extensions/ComfySharp.Extensions/ComfySharp.Extensions.csproj --configuration Release --output packages --no-build
if ($LASTEXITCODE -ne 0) {
    Write-Host "Failed to pack ComfySharp.Extensions!" -ForegroundColor Red
    exit 1
}

Write-Host "✓ ComfySharp.Extensions package created" -ForegroundColor Green
Write-Host ""

# 3. Build and pack ComfySharp.Extensions.Nunchaku
Write-Host "3. Building ComfySharp.Extensions.Nunchaku..." -ForegroundColor Cyan
dotnet build ComfySharp.Extensions.Nunchaku/ComfySharp.Extensions.Nunchaku/ComfySharp.Extensions.Nunchaku.csproj --configuration Release
if ($LASTEXITCODE -ne 0) {
    Write-Host "Failed to build ComfySharp.Extensions.Nunchaku!" -ForegroundColor Red
    exit 1
}

dotnet pack ComfySharp.Extensions.Nunchaku/ComfySharp.Extensions.Nunchaku/ComfySharp.Extensions.Nunchaku.csproj --configuration Release --output packages --no-build
if ($LASTEXITCODE -ne 0) {
    Write-Host "Failed to pack ComfySharp.Extensions.Nunchaku!" -ForegroundColor Red
    exit 1
}

Write-Host "✓ ComfySharp.Extensions.Nunchaku package created" -ForegroundColor Green
Write-Host ""

# 4. Build and pack ComfySharp.Extensions.ReActor
Write-Host "4. Building ComfySharp.Extensions.ReActor..." -ForegroundColor Cyan
dotnet build ComfySharp.Extensions.ReActor/ComfySharp.Extensions.ReActor/ComfySharp.Extensions.ReActor.csproj --configuration Release
if ($LASTEXITCODE -ne 0) {
    Write-Host "Failed to build ComfySharp.Extensions.ReActor!" -ForegroundColor Red
    exit 1
}

dotnet pack ComfySharp.Extensions.ReActor/ComfySharp.Extensions.ReActor/ComfySharp.Extensions.ReActor.csproj --configuration Release --output packages --no-build
if ($LASTEXITCODE -ne 0) {
    Write-Host "Failed to pack ComfySharp.Extensions.ReActor!" -ForegroundColor Red
    exit 1
}

Write-Host "✓ ComfySharp.Extensions.ReActor package created" -ForegroundColor Green
Write-Host ""

# 5. Build and pack ComfySharp.Extensions.EasyUse
Write-Host "5. Building ComfySharp.Extensions.EasyUse..." -ForegroundColor Cyan
dotnet build ComfySharp.Extensions.EasyUse/ComfySharp.Extensions.EasyUse/ComfySharp.Extensions.EasyUse.csproj --configuration Release
if ($LASTEXITCODE -ne 0) {
    Write-Host "Failed to build ComfySharp.Extensions.EasyUse!" -ForegroundColor Red
    exit 1
}

dotnet pack ComfySharp.Extensions.EasyUse/ComfySharp.Extensions.EasyUse/ComfySharp.Extensions.EasyUse.csproj --configuration Release --output packages --no-build
if ($LASTEXITCODE -ne 0) {
    Write-Host "Failed to pack ComfySharp.Extensions.EasyUse!" -ForegroundColor Red
    exit 1
}

Write-Host "✓ ComfySharp.Extensions.EasyUse package created" -ForegroundColor Green
Write-Host ""

# Add packages to local NuGet source
Write-Host "Adding packages to local NuGet source..." -ForegroundColor Yellow
dotnet nuget add source packages --name "ComfySharp-Local" --configfile nuget.config
if ($LASTEXITCODE -ne 0) {
    Write-Host "Warning: Could not add local NuGet source" -ForegroundColor Yellow
}

Write-Host ""
Write-Host "Build completed successfully!" -ForegroundColor Green
Write-Host "Packages created in 'packages' directory:" -ForegroundColor Green

# List created packages
Get-ChildItem "packages\*.nupkg" | ForEach-Object {
    Write-Host "  - $($_.Name)" -ForegroundColor Cyan
}

Write-Host ""
Write-Host "To use these packages in your projects:" -ForegroundColor Yellow
Write-Host "1. Add the local source to your nuget.config:" -ForegroundColor White
Write-Host "   dotnet nuget add source packages --name 'ComfySharp-Local'" -ForegroundColor Gray
Write-Host ""
Write-Host "2. Install packages:" -ForegroundColor White
Write-Host "   dotnet add package ComfySharp --source packages" -ForegroundColor Gray
Write-Host "   dotnet add package ComfySharp.Extensions --source packages" -ForegroundColor Gray
Write-Host "   dotnet add package ComfySharp.Extensions.Nunchaku --source packages" -ForegroundColor Gray
Write-Host "   dotnet add package ComfySharp.Extensions.ReActor --source packages" -ForegroundColor Gray
Write-Host "   dotnet add package ComfySharp.Extensions.EasyUse --source packages" -ForegroundColor Gray
Write-Host ""
Write-Host "3. Or reference them directly in your project files" -ForegroundColor White
