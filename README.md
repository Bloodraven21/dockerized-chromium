# Dockerized Chromium Browser with Remote Debugging

This Docker image allows you to run a headless Chromium browser and expose it via the Chrome DevTools Protocol (CDP). You can control the browser remotely using CDP from a local Chrome browser or via any CDP-compatible tool.

## Prerequisites

Before using this Docker image, ensure the following are installed on your machine:

- Docker
- A web browser (e.g., Google Chrome)

## How to Use

### 1. Build the Docker Image

First, clone this repository and navigate to the directory containing the `Dockerfile`.

```bash
git clone https://github.com/Bloodraven21/dockerized-chromium.git
cd dockerized-chromium
docker build -t dockerized-chromium .
docker run -p 9222:9222 dockerized-chromium
```

To open a new tab in the Dockerized Chromium, use the following curl command:

```bash
curl -X PUT http://localhost:9222/json/new?url=https://www.google.com
```

Output
```bash

{
   "description": "",
   "devtoolsFrontendUrl": "/devtools/inspector.html?ws=localhost:9222/devtools/page/039D8E871F599B6B88F0B8D5564DDA3A",
   "id": "039D8E871F599B6B88F0B8D5564DDA3A",
   "title": "",
   "type": "page",
   "url": "about:blank",
   "webSocketDebuggerUrl": "ws://localhost:9222/devtools/page/039D8E871F599B6B88F0B8D5564DDA3A"
}
```


Once the new page is opened, you will see a devtoolsFrontendUrl in the response. Open this URL in your local Chrome browser to access the DevTools interface for the page.

URL
```http://localhost:9222/devtools/inspector.html?ws=localhost:9222/devtools/page/039D8E871F599B6B88F0B8D5564DDA3A```