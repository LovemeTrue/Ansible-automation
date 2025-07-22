# Docker file for a Java application using Maven
# This Dockerfile builds a Java application using OpenJDK 21 on an ARM64 architecture

# Используем arm64 image для debian/ubuntu. 
FROM eclipse-temurin:17-jdk
# Устанавливаем рабочую директорию
WORKDIR /java-app

# Копируем исходный код
COPY HelloWorldServer.java .

# Запускаем исходный код
RUN apt-get update && apt-get install -y curl && \
    javac HelloWorldServer.java

# Открываем порт
EXPOSE 8080

# Создаем healthcheck для проверки состояния приложения
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s \
  CMD curl -f http://localhost:8080/ || exit 1

# Запускаем приложение
CMD ["java", "HelloWorldServer"]
