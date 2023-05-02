FROM python:3.9-slim


RUN apt-get update && apt-get install -y \
    libxrender1 \
    libxext6 \
    wkhtmltopdf
