FROM nginx:alpine

RUN rm /etc/nginx/conf.d/default.conf

RUN mkdir -p /etc/nginx/sites-enabled
COPY nginx.conf /etc/nginx/nginx.conf
COPY sites-enabled/ /etc/nginx/sites-enabled/

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]