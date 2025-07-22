# Используем официальный Python 3.12 slim-образ
FROM python:3.12-slim

# Устанавливаем переменные окружения
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

# Установка зависимостей системы 
RUN apt-get update && apt-get install -y docker.io curl && apt-get clean && \
    rm -rf /var/lib/apt/lists/*
# Устанавливаем рабочую директорию
WORKDIR /flask-app

# Устанавливаем зависимости
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Копируем исходный код
COPY . .

# Открываем порт
EXPOSE 5000

# Создаем healthcheck для проверки состояния приложения
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s \
  CMD curl -f http://localhost:5000/ || exit 1

# Запускаем приложение
CMD ["python", "app.py"]
