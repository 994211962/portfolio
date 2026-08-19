@echo off
chcp 65001 >nul 2>&1
title 林杰涛 · 摄影摄像作品集 - 本地服务器
echo.
echo  正在启动本地服务器...
echo.
powershell -ExecutionPolicy Bypass -File "%~dp0serve.ps1"
pause
