@echo off
echo Starting ProductsAPI...
echo.

REM Navigate to the solution directory
cd /d "%~dp0"

REM Check if .NET is installed
dotnet --version >nul 2>&1
if errorlevel 1 (
    echo ERROR: .NET SDK is not installed or not in PATH
    echo Please install .NET 9.0 SDK from https://dotnet.microsoft.com/download
    pause
    exit /b 1
)

echo .NET SDK Version:
dotnet --version
echo.

REM Restore packages
echo Restoring packages...
dotnet restore ProductsAPI.sln

REM Build the solution
echo Building solution...
dotnet build ProductsAPI.sln

if errorlevel 1 (
    echo.
    echo ERROR: Build failed. Please check the error messages above.
    pause
    exit /b 1
)

echo.
echo SUCCESS: Build completed successfully!
echo.
echo Starting the API server...
echo Press Ctrl+C to stop the server
echo.

REM Run the application
dotnet run --project ProductsAPI
