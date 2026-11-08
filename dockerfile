# Small static website served by nginx
FROM        registry.redhat.io/ubi10/ubi:10.0
LABEL       maintainer="platform-team@example.com"
RUN         dnf install -y nginx
EXPOSE      8080
ENV         SITE_NAME "Demo Site"
ADD         https://example.com/assets/logo.png /usr/share/nginx/html/
COPY        ./site/   /usr/share/nginx/html/
COPY        ./nginx.conf   /etc/nginx/nginx.conf
USER        nginx
ENTRYPOINT  ["nginx"]
CMD         ["-g", "daemon off;"]
