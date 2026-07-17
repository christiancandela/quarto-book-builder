FROM ghcr.io/quarto-dev/quarto:latest
ENV DEBIAN_FRONTEND=noninteractive

#
# Herramientas adicionales
#
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    wget \
    git \
    ca-certificates \
    unzip \
    xz-utils \
    fonts-dejavu \
    fonts-liberation \
    fonts-noto \
 && rm -rf /var/lib/apt/lists/*

 # Instalar Node.js 24 desde NodeSource

RUN curl -fsSL https://deb.nodesource.com/setup_24.x | bash - \
    && apt-get install -y nodejs \
    && npm install -g @mermaid-js/mermaid-cli \
    && npm cache clean --force

# Instala Chrome Headless Shell (recomendado por Quarto)
RUN quarto install chrome-headless-shell

CMD ["bash"]