FROM ubuntu:20.04

# Установка зависимостей
RUN apt-get update && apt-get install -y \
    libxrender1 \
    libfontconfig1 \
    libxtst6 \
    libjpeg-turbo8 \
    xfonts-75dpi \
    xfonts-base \
    wget \
    python3 \
    python3-pip

# Установка wkhtmltopdf
RUN wget -q -O /tmp/wkhtmltox.deb https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6-1/wkhtmltox_0.12.6-1.focal_amd64.deb && \
    dpkg -i /tmp/wkhtmltox.deb && \
    apt-get -y --no-install-recommends install -f && \
    rm -rf /var/lib/apt/lists/*

# Копирование файлов проекта
COPY requirements.txt /app/
RUN pip3 install --no-cache-dir -r /app/requirements.txt
COPY school1.py /app/

# Установка рабочей директории
WORKDIR /app

# Запуск приложения
CMD ["python3", "school1.py"]
