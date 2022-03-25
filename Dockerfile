FROM nginx:1.21.6-alpine
RUN apk update && apk upgrade

WORKDIR /usr/share/nginx/html

COPY nginx.conf /etc/nginx/conf.d/
COPY index.html .
COPY ./cv.png .

CMD ["/bin/sh", "-c", "nginx -g \"daemon off;\""]
