# Personal Static Site — Docker + Nginx + Ubuntu

My personal website, built with Nginx on Ubuntu and containerized using Docker.
All configurations — including installation, server block setup, non-root user, and healthcheck — were written from scratch.

---

## Tech Stack

- Ubuntu 24.04
- Nginx
- Docker
- HTML/CSS (Static Site)

---

## Project Structure

```
.
├── Dockerfile       # Docker image definition
├── nginx.conf       # Main Nginx configuration
├── site.conf        # Virtual host / server block config
├── index.html       # Static HTML page
└── README.md
```

---

## Getting Started

### 1. Build the image

```bash
docker build -t personal-site .
```

### 2. Run the container

```bash
docker run -p 8080:8080 personal-site
```

### 3. Open in browser

```
http://localhost:8080
```

---

## Features

- Runs as a non-root user (security best practice)
- Built-in healthcheck via curl
- Logs to stdout/stderr (Docker-friendly)
- Gzip compression enabled
- Static asset caching (7 days)