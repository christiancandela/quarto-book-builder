FROM mcr.microsoft.com/playwright:v1.54.0-jammy

ENV DEBIAN_FRONTEND=noninteractive

#
# Herramientas adicionales
#
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    git \
    unzip \
    xz-utils \
    fonts-dejavu \
    fonts-liberation \
    fonts-noto \
 && rm -rf /var/lib/apt/lists/*

#
# Mermaid CLI
#
RUN npm install -g @mermaid-js/mermaid-cli

#
# Quarto
#
RUN wget https://github.com/quarto-dev/quarto-cli/releases/download/v1.9.37/quarto-1.9.37-linux-amd64.deb \
 && apt-get install -y ./quarto-1.9.37-linux-amd64.deb \
 && rm quarto-1.9.37-linux-amd64.deb

#
# Playwright ya instala Chromium.
#
ENV PUPPETEER_EXECUTABLE_PATH=/ms-playwright/chromium-*/chrome-linux/chrome

CMD ["bash"]