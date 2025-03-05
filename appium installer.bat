@echo off
setlocal enabledelayedexpansion

:: Check if Node.js is installed
node -v >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] Node.js is not installed. Download it from https://nodejs.org and install it!
    pause
    exit /b
)

echo [INFO] Node.js is installed.

:: Install Appium
echo [INFO] Installing Appium...
npm install -g appium
if %errorlevel% neq 0 (
    echo [ERROR] Error during Appium installation!
    pause
    exit /b
)

echo [INFO] Appium was successfully installed.

:: Install Android driver (UIAutomator2)
echo [INFO] Installing Appium Android driver...
appium driver install uiautomator2
if %errorlevel% neq 0 (
    echo [ERROR] Error during Android driver installation!
    pause
    exit /b
)

echo [INFO] Appium and Android driver are installed.

echo [INFO] Verifying installation...
appium -v
if %errorlevel% neq 0 (
    echo [ERROR] Appium is not properly installed!
    pause
    exit /b
)

echo [SUCCESS] Appium is installed and ready to use!
pause