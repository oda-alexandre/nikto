# IMAGE TO USE
FROM debian:stretch-slim

# MAINTAINER
MAINTAINER https://www.oda-alexandre.com/

# VARIABLES
ENV USER nikto
ENV PORTS 9999
ENV DEBIAN_FRONTEND noninteractive

# INSTALL PACKAGES
RUN apt-get update && apt-get install --no-install-recommends -y \
ca-certificates \
apt-transport-https \
gnupg \
pgpgpg \
dirmngr \
xz-utils \
sudo \
tor \
privoxy \
proxychains \
wget && \

# CHANGE OF FILE /etc/apt/sources.list WITH REPOS kali-rolling contrib non-free
echo 'deb https://http.kali.org/kali kali-rolling main contrib non-free' >> /etc/apt/sources.list && \
echo 'deb-src https://http.kali.org/kali kali-rolling main contrib non-free' >> /etc/apt/sources.list && \
wget -q -O - https://archive.kali.org/archive-key.asc | apt-key add && \

# INSTALL APP
apt-get update && apt-get install --no-install-recommends -y \
nikto && \

# ADD USER
useradd -d /home/${USER} -m ${USER} && \
passwd -d ${USER} && \
adduser ${USER} sudo

# SELECT USER
USER ${USER}

# SELECT WORKING SPACE
WORKDIR /home/${USER}

# CONFIG TOR & PRIVOXY
RUN sudo rm -f /etc/privoxy/config && \
sudo rm -f /etc/tor/torcc && \
echo "listen-address localhost:8118" | sudo tee -a /etc/privoxy/config && \
echo "forward-socks5 / localhost:9050 ." | sudo tee -a /etc/privoxy/config && \
echo "forward-socks4 / localhost:9050 ." | sudo tee -a /etc/privoxy/config && \
echo "forward-socks4a / localhost:9050 ." | sudo tee -a /etc/privoxy/config && \
echo "SOCKSPort localhost:9050" | sudo tee -a /etc/tor/torcc && \
sudo sed -i 's|#PROXYHOST=127.0.0.1|PROXYHOST=127.0.0.1|g' /etc/nikto.conf && \
sudo sed -i 's|#PROXYPORT=8080|PROXYPORT=8118|g' /etc/nikto.conf

# CLEANING
RUN sudo apt-get --purge autoremove -y \
wget && \
sudo apt-get autoclean -y && \
sudo rm /etc/apt/sources.list && \
sudo rm -rf /var/cache/apt/archives/* && \
sudo rm -rf /var/lib/apt/lists/*

# OPENING PORTS
EXPOSE ${PORTS}

# START THE CONTAINER
CMD /bin/bash \
