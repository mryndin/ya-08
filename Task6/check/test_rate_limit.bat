@echo off
chcp 65001 >nul
echo ========================================
echo  Тест Rate Limiting Nginx (15 запросов)
echo ========================================
echo.

echo [1/3] Запускаем Docker Compose...
docker-compose up -d --quiet-pull
timeout /t 5 /nobreak >nul

echo [2/3] Отправляем запросы (ожидается 200 и потом 429)...
echo.
for /l %%i in (1,1,15) do (
    curl -s -o NUL -w "Request %%i: HTTP %%{http_code}\r\n" http://localhost:8080
)

echo.
echo [3/3] Останавливаем окружение...
docker-compose down >nul
echo.
echo Готово. Проверьте вывод выше.
pause