FROM python:3.9.7-slim-buster
RUN apt-get update && \
    apt-get install -y wget && \
    wget -q https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6-1/wkhtmltox_0.12.6-1.buster_amd64.deb && \
    apt-get install -y ./wkhtmltox_0.12.6-1.buster_amd64.deb && \
    apt-get clean && \
    rm ./wkhtmltox_0.12.6-1.buster_amd64.deb
