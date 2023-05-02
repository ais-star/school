FROM python:3.10-slim


RUN apt-get update && apt-get install -y \
    libxrender1 \
    libxext6 \
    wkhtmltopdf
