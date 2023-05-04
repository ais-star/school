FROM ubuntu:20.04

# Устанавливаем зависимости для wkhtmltopdf
RUN apt-get update && \
    apt-get install -y \
        libxrender1 \
        libfontconfig1 \
        libxtst6 \
        libjpeg-turbo8 \
        xfonts-75dpi \
        xfonts-base \
        wget \
    && wget -q -O /tmp/wkhtmltox.deb "https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6-1/wkhtmltox_0.12.6-1.focal_amd64.deb" \
    && dpkg -i /tmp/wkhtmltox.deb \
    && apt-get -y --no-install-recommends install -f \
    && rm -rf /var/lib/apt/lists/*

# Устанавливаем необходимые Python-библиотеки
RUN apt-get update && \
    apt-get install -y \
        python3 \
        python3-pip \
        python3-setuptools \
        python3-wheel \
        fontconfig \
    && pip3 install python-telegram-bot pdfkit

# Копируем файлы проекта в Docker-контейнер
WORKDIR /app
COPY . /app

# Устанавливаем переменную окружения PORT для приложения
ENV PORT 8080

# Запускаем сервер
CMD ["python3", "server.py"]
