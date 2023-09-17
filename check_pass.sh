#!/bin/bash

# Пароль, который мы хотим проверить
desired_password="HelloMyFriend#123"

# Перебор всех пользователей в системе
while IFS=: read -r username _ uid gid gecos home shell; do
  # Установить пароль для текущего пользователя
  echo "$username:$desired_password" | chpasswd
  # Проверить, имеет ли пользователь доступ к оболочке Bash
  if [[ "$shell" == *"/bash" ]]; then
    echo "Пользователь $username имеет доступ к оболочке Bash с паролем '$desired_password'"
  fi
done < /etc/passwd
