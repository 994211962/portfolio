@echo off
chcp 65001 >nul 2>&1
title 部署作品集到 Cloudflare Pages

echo ============================================
echo   部署作品集到 Cloudflare Pages
echo ============================================
echo.

echo 步骤 1: 释放端口 8976 (需要管理员权限)
echo 正在请求管理员权限...
powershell -Command "Start-Process cmd -ArgumentList '/c net stop winnat ^&^& timeout /t 2 ^>nul ^&^& net start winnat ^&^& timeout /t 2 ^>nul' -Verb RunAs -Wait"
echo 端口已释放
echo.

echo 步骤 2: 启动 Cloudflare 登录
echo 浏览器将自动打开，请在浏览器中点击 "Allow" 授权
echo 如果浏览器没有自动打开，请手动复制下面的链接到浏览器
echo.
cd /d "C:\Users\ldapang\AppData\Roaming\TRAE SOLO CN\ModularData\ai-agent\work-mode-projects\6a4cf2dcd2f62b3a21c0856c\portfolio"
call npx wrangler login
echo.

echo 步骤 3: 部署到 Cloudflare Pages
call npx wrangler pages deploy . --project-name=zhaoyang --commit-message="Add AI video section"
echo.

echo 步骤 4: 部署完成！
echo 你的作品集已发布到: https://zhaoyang.pages.dev
echo.
pause
