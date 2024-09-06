FROM debian:bullseye-slim

RUN apt-get update && apt-get install -y \
    chromium \
    libx11-xcb1 \
    libxcomposite1 \
    libxcursor1 \
    libxdamage1 \
    libxi6 \
    libxtst6 \
    libnss3 \
    libxrandr2 \
    libasound2 \
    libatk1.0-0 \
    libgtk-3-0 \
    wget \
    xvfb \
    curl \
    --no-install-recommends \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

ENV DISPLAY=:99

ENTRYPOINT ["chromium", "--no-sandbox", "--headless", "--remote-debugging-address=0.0.0.0", "--remote-debugging-port=9222", "--remote-allow-origins=*", "--disable-gpu", "--disable-software-rasterizer", "https://www.google.com","--ignore-certificate-errors","--disable-web-security"]

EXPOSE 9222
