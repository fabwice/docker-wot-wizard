FROM ubuntu:latest
  
MAINTAINER Fabwice <wotWizard@fabwice.com>

ARG WOT_WIZARD_VERSION=4.1.2
 
VOLUME /var/lib/duniter

RUN \
    sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
    apt-get update && \
    apt-get -y upgrade && \
    apt-get install -y build-essential && \
    apt-get install -y software-properties-common && \
    apt-get install -y curl unzip nano wget && \
    rm -rf /var/lib/apt/lists/*

RUN groupadd -r duniter -g 1111 && useradd -u 1111 -r -g duniter -m -d /duniter -s /sbin/nologin -c "Duniter user" duniter && \
    chmod 755 /duniter

RUN mkdir -p /var/lib/duniter /etc/wotWizard && chown duniter:duniter /var/lib/duniter /etc/wotWizard && \
    cd /etc/wotWizard && \
    wget https://github.com/duniter/WotWizard/releases/download/v${WOT_WIZARD_VERSION}/wwServer && \
    chmod +x /etc/wotWizard/wwServer && \
    mkdir -p /duniter/.config/duniter/duniter_default && \
    ln -s /var/lib/duniter/duniter_default/duniter.db /duniter/.config/duniter/duniter_default/wotwizard-export.db


EXPOSE 9222

USER duniter
WORKDIR /etc/wotWizard

CMD ["/etc/wotWizard/wwServer"]
