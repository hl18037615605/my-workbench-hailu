@echo off
chcp 65001 >nul
title 设计师工作台

echo ========================================
echo      设计师工作台 - 本地启动
echo ========================================
echo.

cd /d "%~dp0"

:: 检测 Python
where python >nul 2>nul
if %errorlevel%==0 (
    echo 正在启动本地服务器...
    echo.
    echo 服务器地址: http://localhost:8080
    echo 按 Ctrl+C 可停止服务器
    echo.
    start "" "http://localhost:8080"
    python -m http.server 8080
    goto :end
)

:: 检测 Node.js
where npx >nul 2>nul
if %errorlevel%==0 (
    echo 正在启动本地服务器...
    echo.
    echo 服务器地址: http://localhost:8080
    echo 按 Ctrl+C 可停止服务器
    echo.
    start "" "http://localhost:8080"
    npx --yes serve -l 8080 .
    goto :end
)

echo.
echo [错误] 未检测到 Python 或 Node.js
echo.
echo 请选择以下方式之一：
echo 1. 安装 Python: https://www.python.org/downloads/
echo 2. 安装 Node.js: https://nodejs.org/
echo 3. 部署到免费静态平台（推荐，详见使用说明.txt）
echo.
pause

:end
