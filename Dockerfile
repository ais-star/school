FROM python:3.8-slim-buster

# Обновить пакетный менеджер и установить зависимости для wkhtmltopdf
RUN apt-get update && \
    apt-get install -y \
        libxrender1 \
        libfontconfig1 \
        libxtst6 \
        libjpeg62-turbo \
        xfonts-75dpi \
        xfonts-base \
        wget \
    && wget -q -O /tmp/wkhtmltox.deb "https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.6/wkhtmltox_0.12.6-1.buster_amd64.deb" \
    && dpkg -i /tmp/wkhtmltox.deb \
    && apt-get -y --no-install-recommends install -f \
    && rm -rf /var/lib/apt/lists/*

# Установить библиотеку pdfkit для Python
RUN pip install pdfkit

# Скопировать файлы приложения в Docker-контейнер
WORKDIR /app
COPY . /app

# Установить переменную окружения PORT для приложения
ENV PORT 8080

# Запустить сервер
CMD ["python", "school1.py"]
