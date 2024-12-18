# Используем официальный образ Go для сборки приложения
FROM golang:1.23 AS builder

# Устанавливаем рабочую директорию внутри контейнера
WORKDIR /app

# Копируем все файлы проекта в рабочую директорию контейнера
COPY . .

# Сборка Go приложения
RUN go build -o myapp

# Используем минималистичный образ для запуска
FROM alpine:latest

# Устанавливаем рабочую директорию внутри контейнера
WORKDIR /root/

# Копируем исполняемый файл из предыдущего контейнера
COPY --from=builder /app/myapp .

# Указываем команду для запуска приложения
CMD ["./myapp"]

