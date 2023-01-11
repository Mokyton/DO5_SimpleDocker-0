FROM nginx

WORKDIR /home/
COPY ./hello.c .
COPY ./run.sh .
COPY ./nginx/nginx.conf /etc/nginx/nginx.conf
RUN apt-get update; \
apt-get install -y gcc spawn-fcgi libfcgi-dev;


ENTRYPOINT ["sh", "./run.sh"]
