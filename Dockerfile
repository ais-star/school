# Установка базового образа
FROM python:3.8-slim-buster

# Установка зависимостей wkhtmltopdf
RUN apt-get update && apt-get install -y \
    wget \
    xz-utils \
    libfontconfig \
    libxrender1 \
    libjpeg62-turbo \
    libxt6 \
    libx11-6 \
 && wget -q https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.6/wkhtmltox_0.12.6-1.buster_amd64.deb \
 && dpkg --force-depends -i wkhtmltox_0.12.6-1.buster_amd64.deb \
 && apt-get -y install -f \
 && rm wkhtmltox_0.12.6-1.buster_amd64.deb

# Копирование проекта в контейнер
COPY . /school
WORKDIR /school

# Установка зависимостей Python
RUN pip install -r requirements.txt

# Запуск приложения
CMD ["python", "school1.py"]
