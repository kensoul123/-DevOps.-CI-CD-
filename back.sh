#!/bin/bash

# Исходная директория
SOURCE_DIR="/home/nginx"
# Целевая директория
TARGET_DIR="/tmp/backup"
# Команда rsync. Cтандартный вывод - в /dev/null, ошибки - в лог.
rsync -a --checksum --exclude=".*" "$SOURCE_DIR" "$TARGET_DIR" > /dev/null 2>> /var/log/backup.log

# Проверка кода завершения rsync и запись лога
if [ $? -eq 0 ]; then
    echo "[$(date)] Резервное копирование успешно выполнено" >> /var/log/backup.log
else
    echo "[$(date)] Ошибка при выполнении резервного копирования" >> /var/log/backup.log
fi



