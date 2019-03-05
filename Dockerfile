FROM debian:stretch-slim

MAINTAINER https://oda-alexandre.com

# VARIABLES
ENV USER nikto \
DEBIAN_FRONTEND noninteractive

# INSTALLATION DES PREREQUIS
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

# MODIFICATION DU FICHIER /etc/apt/sources.list AVEC LES REPOS kali-rolling contrib non-free
echo 'deb https://http.kali.org/kali kali-rolling main contrib non-free' >> /etc/apt/sources.list && \
echo 'deb-src https://http.kali.org/kali kali-rolling main contrib non-free' >> /etc/apt/sources.list && \
wget -q -O - https://archive.kali.org/archive-key.asc | apt-key add && \

# INSTALLATION DE L'APPLICATION
apt-get update && apt-get install --no-install-recommends -y \
nikto && \

# AJOUT UTILISATEUR
useradd -d /home/${USER} -m ${USER} && \
passwd -d ${USER} && \
adduser ${USER} sudo

# SELECTION UTILISATEUR
USER ${USER}

# CONFIGURATION TOR & PRIVOXY
RUN sudo rm -f /etc/privoxy/config && \
sudo rm -f /etc/tor/torcc && \
echo "listen-address localhost:8118" | sudo tee -a /etc/privoxy/config && \
echo "forward-socks5 / localhost:9050 ." | sudo tee -a /etc/privoxy/config && \
echo "forward-socks4 / localhost:9050 ." | sudo tee -a /etc/privoxy/config && \
echo "forward-socks4a / localhost:9050 ." | sudo tee -a /etc/privoxy/config && \
echo "SOCKSPort localhost:9050" | sudo tee -a /etc/tor/torcc && \
sudo sed -i 's|#PROXYHOST=127.0.0.1|PROXYHOST=127.0.0.1|g' /etc/nikto.conf && \
sudo sed -i 's|#PROXYPORT=8080|PROXYPORT=8118|g' /etc/nikto.conf

# NETTOYAGE
RUN sudo apt-get --purge autoremove -y \
wget && \
sudo apt-get autoclean -y && \
sudo rm /etc/apt/sources.list && \
sudo rm -rf /var/cache/apt/archives/* && \
sudo rm -rf /var/lib/apt/lists/*

# SELECTION ESPACE DE TRAVAIL
WORKDIR /home/${USER}

# COMMANDE AU DEMARRAGE DU CONTENEUR
CMD /bin/bash
