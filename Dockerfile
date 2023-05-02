FROM python:3.8-slim-buster

# Установка wkhtmltopdf
COPY wkhtmltox_0.12.6-1.buster_amd64.deb /tmp
RUN apt-get update && \
    apt-get install -y --no-install-recommends /tmp/wkhtmltox_0.12.6-1.buster_amd64.deb && \
    rm /tmp/wkhtmltox_0.12.6-1.buster_amd64.deb

# Копирование файлов проекта и установка зависимостей
WORKDIR /app
COPY requirements.txt .
RUN pip install -r requirements.txt
COPY . .

CMD ["python", "school1.py"]