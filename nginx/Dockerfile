FROM nginx:stable

RUN rm -f /etc/nginx/conf.d/*

ADD nginx.conf /etc/nginx/nginx.conf
ADD default.conf /etc/nginx/conf.d/default.conf


CMD /usr/sbin/nginx -g 'daemon off;' -c /etc/nginx/nginx.conf