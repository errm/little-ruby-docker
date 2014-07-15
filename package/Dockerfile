FROM ubuntu:14.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get install -y build-essential bison openssl libreadline6 libreadline6-dev zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-0 libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev autoconf libc6-dev ssl-cert subversion gawk subversion wget git git-core
RUN useradd -m openwrt &&\
    echo 'openwrt ALL=NOPASSWD: ALL' > /etc/sudoers.d/openwrt &&\
    sudo -iu openwrt /bin/bash -c 'wget --quiet http://downloads.openwrt.org/snapshots/trunk/x86_64/OpenWrt-SDK-x86_64-for-linux-x86_64-gcc-4.8-linaro_uClibc-0.9.33.2.tar.bz2 &&\
    tar xjf OpenWrt-SDK-x86_64-for-linux-x86_64-gcc-4.8-linaro_uClibc-0.9.33.2.tar.bz2 &&\
    rm OpenWrt-SDK-x86_64-for-linux-x86_64-gcc-4.8-linaro_uClibc-0.9.33.2.tar.bz2 &&\
    mv OpenWrt-SDK-x86_64-for-linux-x86_64-gcc-4.8-linaro_uClibc-0.9.33.2 sdk'
ADD ruby /home/openwrt/sdk/package/ruby
RUN cd /home/openwrt/sdk/package/ruby &&\
    chown openwrt:openwrt Makefile &&\
    chown openwrt:openwrt patches/001-ignore_wide_getaddrinfo_while_crosscompiling.patch
ENTRYPOINT chown openwrt:openwrt /home/openwrt/sdk/bin/ &&\ 
           sudo -iu openwrt /bin/bash -c 'cd sdk &&\
           make package/ruby/{clean,compile,install} V=s'
