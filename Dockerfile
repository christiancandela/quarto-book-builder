FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

#
# Dependencias del sistema
#
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    git \
    unzip \
    ca-certificates \
    xz-utils \
    fonts-dejavu \
    fonts-liberation \
    fonts-noto \
    chromium-browser \
    npm \
    && rm -rf /var/lib/apt/lists/*

#
# Node LTS
#
RUN npm install -g n
RUN n 20

#
# Mermaid CLI
#
RUN npm install -g @mermaid-js/mermaid-cli

#
# Quarto
#
RUN wget https://github.com/quarto-dev/quarto-cli/releases/download/v1.9.37/quarto-1.9.37-linux-arm64.deb \
 && apt-get update \
 && apt-get install -y ./quarto-1.9.37-linux-arm64.deb \
 && rm quarto-1.9.37-linux-arm64.deb

#
# Variables para Mermaid
#
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-browser

CMD ["bash"]