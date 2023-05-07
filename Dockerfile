FROM ubuntu:20.04

RUN apt-get update && apt-get install -y \
    fontconfig \
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
