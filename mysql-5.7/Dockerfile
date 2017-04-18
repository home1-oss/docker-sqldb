
FROM mysql:5.7.17

# -------------------- Locale --------------------

#ENV DEBIAN_FRONTEND noninteractive
#ENV DEBCONF_NONINTERACTIVE_SEEN true

# apt-get purge -yq tzdata locales debconf can not or should not be removed
COPY docker/debconf.txt /etc/debconf.txt
RUN echo "deb http://ftp.jp.debian.org/debian sid main" > /etc/apt/sources.list && \
    apt-get update && \
    apt-get -yq install --reinstall locales tzdata debconf && \
    debconf-set-selections /etc/debconf.txt && \
    echo "Asia/Shanghai" > /etc/timezone && \
    dpkg-reconfigure -f noninteractive tzdata && \
    echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
    dpkg-reconfigure -f noninteractive locales && \
    apt-get autoremove -yq && \
    apt-get clean

ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

# -------------------- Locale --------------------
