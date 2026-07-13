# Static build for the AI-OS landing (site/), served by nginx.
# Coolify builds this from the repo root (dockerfile_location=/Dockerfile,
# base_directory=/). ports_exposes must be 80.
FROM nginx:1.27-alpine

# Drop the default nginx site and add ours.
RUN rm -rf /usr/share/nginx/html/*
COPY site/ /usr/share/nginx/html/

# SPA-style fallback + long cache on static assets, no-cache on HTML.
RUN printf '%s\n' \
  'server {' \
  '  listen 80;' \
  '  server_name _;' \
  '  root /usr/share/nginx/html;' \
  '  index index.html;' \
  '  location = /index.html { add_header Cache-Control "no-cache"; }' \
  '  location / { try_files $uri $uri/ /index.html; }' \
  '  add_header X-Content-Type-Options nosniff always;' \
  '  add_header X-Frame-Options DENY always;' \
  '  add_header Referrer-Policy strict-origin-when-cross-origin always;' \
  '  gzip on; gzip_types text/css application/javascript image/svg+xml;' \
  '}' > /etc/nginx/conf.d/default.conf

EXPOSE 80
HEALTHCHECK --interval=30s --timeout=3s --retries=3 \
  CMD wget -qO- http://127.0.0.1/ >/dev/null 2>&1 || exit 1
