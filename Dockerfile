FROM ubuntu:18.04


# # # Perform APT installs if needed
# RUN apt-get purge python

# RUN mkdir -p /etc/apt/apt.conf.d/ && echo 'Acquire::https::Proxy "https://nexus.bluelight.limited/repository/apt.facii/";' > /etc/apt/apt.conf.d/proxy.conf

RUN cat /etc/apt/sources.list && http_proxy=https://nexus.bluelight.limited/repository/apt.facii/ apt-get update && \
    http_proxy=https://nexus.bluelight.limited/repository/apt.facii/ apt-get upgrade -y &&  \
    http_proxy=https://nexus.bluelight.limited/repository/apt.facii/ apt-get  install -y libssl1.0.0 openssl1.0 \
    libssl1.0-dev nmap libyaml-dev tmux dirmngr \
    dbus htop curl libmariadbclient-dev-compat \
    build-essential git gpg curl rsync ca-certificates \
    dnsutils jq moreutils lsof sed \
    apt-transport-https software-properties-common \
    libghc-yaml-dev python3.7 python3-pip
    
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -    && \
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic edge" && \
    http_proxy=https://nexus.bluelight.limited/repository/apt.facii/ apt update && \
    http_proxy=https://nexus.bluelight.limited/repository/apt.facii/ apt -y install docker-ce
  
RUN \
    update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.6 1 && \
    update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.7 2 && \
    rm /usr/bin/python3 && \
    ln -s python3.7 /usr/bin/python3

#CMD ["/bin/bash", "-c", "top"]