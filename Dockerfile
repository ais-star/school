RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        ca-certificates \
        fonts-freefont-ttf \
        libssl1.1 \
        libx11-xcb1 \
        libxcb1 \
        libxext6 \
        libxrender1 \
        xfonts-75dpi \
        xfonts-base \
        wkhtmltopdf \
    && rm -rf /var/lib/apt/lists/*
