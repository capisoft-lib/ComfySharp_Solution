@echo off
REM ComfySharp Package Build Script
REM Builds packages in dependency order and installs them locally

echo ComfySharp Package Build Script
echo =================================
echo.

REM Clean previous builds
echo Cleaning previous builds...
dotnet clean
if exist "packages" (
    rmdir /s /q "packages"
)

REM Create packages directory
mkdir packages

REM Build and pack in dependency order
echo Building packages in dependency order...
echo.

REM 1. Build and pack ComfySharp (base package)
echo 1. Building ComfySharp (base package)...
dotnet build ComfySharp\ComfySharp\ComfySharp.csproj --configuration Release
if %ERRORLEVEL% neq 0 (
    echo Failed to build ComfySharp!
    exit /b 1
)

dotnet pack ComfySharp\ComfySharp\ComfySharp.csproj --configuration Release --output packages --no-build
if %ERRORLEVEL% neq 0 (
    echo Failed to pack ComfySharp!
    exit /b 1
)

echo ✓ ComfySharp package created
echo.

REM 2. Build and pack ComfySharp.Extensions
echo 2. Building ComfySharp.Extensions...
dotnet build ComfySharp.Extensions\ComfySharp.Extensions\ComfySharp.Extensions.csproj --configuration Release
if %ERRORLEVEL% neq 0 (
    echo Failed to build ComfySharp.Extensions!
    exit /b 1
)

dotnet pack ComfySharp.Extensions\ComfySharp.Extensions\ComfySharp.Extensions.csproj --configuration Release --output packages --no-build
if %ERRORLEVEL% neq 0 (
    echo Failed to pack ComfySharp.Extensions!
    exit /b 1
)

echo ✓ ComfySharp.Extensions package created
echo.

REM 3. Build and pack ComfySharp.Extensions.Nunchaku
echo 3. Building ComfySharp.Extensions.Nunchaku...
dotnet build ComfySharp.Extensions.Nunchaku\ComfySharp.Extensions.Nunchaku\ComfySharp.Extensions.Nunchaku.csproj --configuration Release
if %ERRORLEVEL% neq 0 (
    echo Failed to build ComfySharp.Extensions.Nunchaku!
    exit /b 1
)

dotnet pack ComfySharp.Extensions.Nunchaku\ComfySharp.Extensions.Nunchaku\ComfySharp.Extensions.Nunchaku.csproj --configuration Release --output packages --no-build
if %ERRORLEVEL% neq 0 (
    echo Failed to pack ComfySharp.Extensions.Nunchaku!
    exit /b 1
)

echo ✓ ComfySharp.Extensions.Nunchaku package created
echo.

REM 4. Build and pack ComfySharp.Extensions.ReActor
echo 4. Building ComfySharp.Extensions.ReActor...
dotnet build ComfySharp.Extensions.ReActor\ComfySharp.Extensions.ReActor\ComfySharp.Extensions.ReActor.csproj --configuration Release
if %ERRORLEVEL% neq 0 (
    echo Failed to build ComfySharp.Extensions.ReActor!
    exit /b 1
)

dotnet pack ComfySharp.Extensions.ReActor\ComfySharp.Extensions.ReActor\ComfySharp.Extensions.ReActor.csproj --configuration Release --output packages --no-build
if %ERRORLEVEL% neq 0 (
    echo Failed to pack ComfySharp.Extensions.ReActor!
    exit /b 1
)

echo ✓ ComfySharp.Extensions.ReActor package created
echo.

REM 5. Build and pack ComfySharp.Extensions.EasyUse
echo 5. Building ComfySharp.Extensions.EasyUse...
dotnet build ComfySharp.Extensions.EasyUse\ComfySharp.Extensions.EasyUse\ComfySharp.Extensions.EasyUse.csproj --configuration Release
if %ERRORLEVEL% neq 0 (
    echo Failed to build ComfySharp.Extensions.EasyUse!
    exit /b 1
)

dotnet pack ComfySharp.Extensions.EasyUse\ComfySharp.Extensions.EasyUse\ComfySharp.Extensions.EasyUse.csproj --configuration Release --output packages --no-build
if %ERRORLEVEL% neq 0 (
    echo Failed to pack ComfySharp.Extensions.EasyUse!
    exit /b 1
)

echo ✓ ComfySharp.Extensions.EasyUse package created
echo.

REM Add packages to local NuGet source
echo Adding packages to local NuGet source...
dotnet nuget add source packages --name "ComfySharp-Local" --configfile nuget.config
if %ERRORLEVEL% neq 0 (
    echo Warning: Could not add local NuGet source
)

echo.
echo Build completed successfully!
echo Packages created in 'packages' directory:

REM List created packages
for %%f in (packages\*.nupkg) do (
    echo   - %%~nxf
)

echo.
echo To use these packages in your projects:
echo 1. Add the local source to your nuget.config:
echo    dotnet nuget add source packages --name "ComfySharp-Local"
echo.
echo 2. Install packages:
echo    dotnet add package ComfySharp --source packages
echo    dotnet add package ComfySharp.Extensions --source packages
echo    dotnet add package ComfySharp.Extensions.Nunchaku --source packages
echo    dotnet add package ComfySharp.Extensions.ReActor --source packages
echo    dotnet add package ComfySharp.Extensions.EasyUse --source packages
echo.
echo 3. Or reference them directly in your project files
echo.
