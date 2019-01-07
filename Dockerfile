FROM debian:stretch-slim

MAINTAINER https://oda-alexandre.github.io

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
wget

# MODIFICATION DU FICHIER /etc/apt/sources.list AVEC LES REPOS kali-rolling contrib non-free
RUN echo 'deb https://http.kali.org/kali kali-rolling main contrib non-free' >> /etc/apt/sources.list && \
echo 'deb-src https://http.kali.org/kali kali-rolling main contrib non-free' >> /etc/apt/sources.list && \
wget -q -O - https://archive.kali.org/archive-key.asc | apt-key add

# INSTALLATION DE L'APPLICATION
RUN apt-get update && apt-get install --no-install-recommends -y \
nikto

# AJOUT UTILISATEUR
RUN useradd -d /home/nikto -m nikto && \
passwd -d nikto && \
adduser nikto sudo

# SELECTION UTILISATEUR
USER nikto

# CONFIGURATION TOR & PRIVOXY
RUN sudo rm -f /etc/privoxy/config && \
sudo rm -f /etc/tor/torcc && \
echo "listen-address localhost:8118" | sudo tee -a /etc/privoxy/config && \
echo "forward-socks5 / localhost:9050 ." | sudo tee -a /etc/privoxy/config && \
echo "forward-socks4 / localhost:9050 ." | sudo tee -a /etc/privoxy/config && \
echo "forward-socks4a / localhost:9050 ." | sudo tee -a /etc/privoxy/config && \
echo "SOCKSPort localhost:9050" | sudo tee -a /etc/tor/torcc

# NETTOYAGE
RUN sudo apt-get --purge autoremove -y \
wget && \
sudo apt-get autoclean -y && \
sudo rm /etc/apt/sources.list && \
sudo rm -rf /var/cache/apt/archives/* && \
sudo rm -rf /var/lib/apt/lists/*

# SELECTION ESPACE DE TRAVAIL
WORKDIR /home/nikto

# COMMANDE AU DEMARRAGE DU CONTENEUR
CMD /bin/bash
