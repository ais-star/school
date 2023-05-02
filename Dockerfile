FROM python:3.10.6-slim


RUN apt-get update && apt-get install -y \
    wkhtmltopdf
