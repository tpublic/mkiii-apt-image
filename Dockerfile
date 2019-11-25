FROM docker.bluelight.limited:35000/ubuntu:18.04


# # # Perform APT installs if needed
RUN apt-get update && \
    apt-get upgrade -y &&  \
    apt-get  install -y libssl1.0.0 openssl1.0 \
    libssl1.0-dev nmap libyaml-dev tmux dirmngr \
    dbus htop curl libmariadbclient-dev-compat \
    build-essential git gpg curl rsync ca-certificates \
    dnsutils python-pip jq moreutils lsof sed
    
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -    && \
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable" && \
    apt update && \
    apt -y install docker-ce
  

#CMD ["/bin/bash", "-c", "top"]