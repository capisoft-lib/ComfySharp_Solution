#!/bin/bash
# ComfySharp Package Build Script
# Builds packages in dependency order and installs them locally

echo "ComfySharp Package Build Script"
echo "================================="
echo ""

# Clean previous builds
echo "Cleaning previous builds..."
dotnet clean
if [ -d "packages" ]; then
    rm -rf packages
fi

# Create packages directory
mkdir -p packages

# Build and pack in dependency order
echo "Building packages in dependency order..."
echo ""

# 1. Build and pack ComfySharp (base package)
echo "1. Building ComfySharp (base package)..."
dotnet build ComfySharp/ComfySharp/ComfySharp.csproj --configuration Release
if [ $? -ne 0 ]; then
    echo "Failed to build ComfySharp!"
    exit 1
fi

dotnet pack ComfySharp/ComfySharp/ComfySharp.csproj --configuration Release --output packages --no-build
if [ $? -ne 0 ]; then
    echo "Failed to pack ComfySharp!"
    exit 1
fi

echo "✓ ComfySharp package created"
echo ""

# 2. Build and pack ComfySharp.Extensions
echo "2. Building ComfySharp.Extensions..."
dotnet build ComfySharp.Extensions/ComfySharp.Extensions/ComfySharp.Extensions.csproj --configuration Release
if [ $? -ne 0 ]; then
    echo "Failed to build ComfySharp.Extensions!"
    exit 1
fi

dotnet pack ComfySharp.Extensions/ComfySharp.Extensions/ComfySharp.Extensions.csproj --configuration Release --output packages --no-build
if [ $? -ne 0 ]; then
    echo "Failed to pack ComfySharp.Extensions!"
    exit 1
fi

echo "✓ ComfySharp.Extensions package created"
echo ""

# 3. Build and pack ComfySharp.Extensions.Nunchaku
echo "3. Building ComfySharp.Extensions.Nunchaku..."
dotnet build ComfySharp.Extensions.Nunchaku/ComfySharp.Extensions.Nunchaku/ComfySharp.Extensions.Nunchaku.csproj --configuration Release
if [ $? -ne 0 ]; then
    echo "Failed to build ComfySharp.Extensions.Nunchaku!"
    exit 1
fi

dotnet pack ComfySharp.Extensions.Nunchaku/ComfySharp.Extensions.Nunchaku/ComfySharp.Extensions.Nunchaku.csproj --configuration Release --output packages --no-build
if [ $? -ne 0 ]; then
    echo "Failed to pack ComfySharp.Extensions.Nunchaku!"
    exit 1
fi

echo "✓ ComfySharp.Extensions.Nunchaku package created"
echo ""

# 4. Build and pack ComfySharp.Extensions.ReActor
echo "4. Building ComfySharp.Extensions.ReActor..."
dotnet build ComfySharp.Extensions.ReActor/ComfySharp.Extensions.ReActor/ComfySharp.Extensions.ReActor.csproj --configuration Release
if [ $? -ne 0 ]; then
    echo "Failed to build ComfySharp.Extensions.ReActor!"
    exit 1
fi

dotnet pack ComfySharp.Extensions.ReActor/ComfySharp.Extensions.ReActor/ComfySharp.Extensions.ReActor.csproj --configuration Release --output packages --no-build
if [ $? -ne 0 ]; then
    echo "Failed to pack ComfySharp.Extensions.ReActor!"
    exit 1
fi

echo "✓ ComfySharp.Extensions.ReActor package created"
echo ""

# 5. Build and pack ComfySharp.Extensions.EasyUse
echo "5. Building ComfySharp.Extensions.EasyUse..."
dotnet build ComfySharp.Extensions.EasyUse/ComfySharp.Extensions.EasyUse/ComfySharp.Extensions.EasyUse.csproj --configuration Release
if [ $? -ne 0 ]; then
    echo "Failed to build ComfySharp.Extensions.EasyUse!"
    exit 1
fi

dotnet pack ComfySharp.Extensions.EasyUse/ComfySharp.Extensions.EasyUse/ComfySharp.Extensions.EasyUse.csproj --configuration Release --output packages --no-build
if [ $? -ne 0 ]; then
    echo "Failed to pack ComfySharp.Extensions.EasyUse!"
    exit 1
fi

echo "✓ ComfySharp.Extensions.EasyUse package created"
echo ""

# Add packages to local NuGet source
echo "Adding packages to local NuGet source..."
dotnet nuget add source packages --name "ComfySharp-Local" --configfile nuget.config
if [ $? -ne 0 ]; then
    echo "Warning: Could not add local NuGet source"
fi

echo ""
echo "Build completed successfully!"
echo "Packages created in 'packages' directory:"

# List created packages
for file in packages/*.nupkg; do
    if [ -f "$file" ]; then
        echo "  - $(basename "$file")"
    fi
done

echo ""
echo "To use these packages in your projects:"
echo "1. Add the local source to your nuget.config:"
echo "   dotnet nuget add source packages --name 'ComfySharp-Local'"
echo ""
echo "2. Install packages:"
echo "   dotnet add package ComfySharp --source packages"
echo "   dotnet add package ComfySharp.Extensions --source packages"
echo "   dotnet add package ComfySharp.Extensions.Nunchaku --source packages"
echo "   dotnet add package ComfySharp.Extensions.ReActor --source packages"
echo "   dotnet add package ComfySharp.Extensions.EasyUse --source packages"
echo ""
echo "3. Or reference them directly in your project files"
echo ""
