FROM ubuntu:focal

LABEL maintainer="gpopesc@gmail.com"

ARG DEBIAN_FRONTEND=noninteractive
ARG LANG=us_US.UTF-8
ARG LANGUAGE=us_US.UTF-8

ENV DEBIAN_FRONTEND=${DF} \
    LANG=${LANG} \ 
    LANGUAGE=${LANGUAGE} \
    TZ=${TZ} \
    USER_NAME=${USER_NAME} \
    USER_PASSWORD=${USER_PASSWORD} \
    UID=1000 \
    GID=1000



# mandatory apps
RUN apt-get update && apt-get -y install unzip \
      wget \
      curl \
      apt-utils \
 #     gnupg2 \
      nano \
      tzdata \
#      supervisor \
      procps \
      sudo \
      nano \
      apache2 \
      php7.4 \
#      php7.4-common php7.4-mysql php7.4-xml php7.4-xmlrpc php7.4-curl php7.4-gd php7.4-imagick php7.4-cli php7.4-dev php7.4-imap php7.4-mbstring php7.4-opcache php7.4-soap php7.4-zip php7.4-intl \
      php7.4-common php7.4-curl php7.4-cli php7.4-dev php7.4-opcache php7.4-zip php7.4-intl \
   && rm -rf /var/lib/apt/lists/*

#set working directory to where Apache serves files
WORKDIR /var/www/html
EXPOSE 9000 80

HEALTHCHECK --interval=1m --timeout=10s CMD curl --fail http://127.0.0.1:80

#config files to temp location
RUN mkdir /tmp/script/ && mkdir /tmp/smtp/
COPY ./smtp/* /tmp/smtp/
COPY ./vars.php.SAMPLE /tmp/smtp/
COPY ./script/* /tmp/script/
COPY startup.sh /
RUN chmod +x /startup.sh

CMD ["/startup.sh"]

