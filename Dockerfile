FROM debian:stretch-slim

LABEL authors https://www.oda-alexandre.com

ENV USER nikto
ENV HOME /home/${USER}
ENV PORTS 9999
ENV DEBIAN_FRONTEND noninteractive

RUN echo -e '\033[36;1m ******* INSTALL PACKAGES ******** \033[0m' && \
  apt-get update && apt-get install --no-install-recommends -y \
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
  rm -rf /var/lib/apt/lists/*

RUN echo -e '\033[36;1m ******* ADD contrib non-free IN sources.list ******** \033[0m' && \
  echo 'deb https://http.kali.org/kali kali-rolling main contrib non-free' >> /etc/apt/sources.list && \
  echo 'deb-src https://http.kali.org/kali kali-rolling main contrib non-free' >> /etc/apt/sources.list && \
  wget -q -O - https://archive.kali.org/archive-key.asc | apt-key add && \
  sudo apt-get --purge autoremove -y wget
  
RUN echo -e '\033[36;1m ******* INSTALL APP ******** \033[0m' && \
  apt-get update && apt-get install --no-install-recommends -y \
  nikto && \
  rm -rf /var/lib/apt/lists/*

RUN echo -e '\033[36;1m ******* ADD USER ******** \033[0m' && \
  useradd -d ${HOME} -m ${USER} && \
  passwd -d ${USER} && \
  adduser ${USER} sudo

RUN echo -e '\033[36;1m ******* SELECT USER ******** \033[0m'
USER ${USER}

RUN echo -e '\033[36;1m ******* SELECT WORKING SPACE ******** \033[0m'
WORKDIR ${HOME}

RUN echo -e '\033[36;1m ******* CONFIG TOR & PRIVOXY ******** \033[0m' && \
  sudo rm -f /etc/privoxy/config && \
  sudo rm -f /etc/tor/torcc && \
  echo "listen-address localhost:8118" | sudo tee -a /etc/privoxy/config && \
  echo "forward-socks5 / localhost:9050 ." | sudo tee -a /etc/privoxy/config && \
  echo "forward-socks4 / localhost:9050 ." | sudo tee -a /etc/privoxy/config && \
  echo "forward-socks4a / localhost:9050 ." | sudo tee -a /etc/privoxy/config && \
  echo "SOCKSPort localhost:9050" | sudo tee -a /etc/tor/torcc

RUN echo -e '\033[36;1m ******* CONFIG APP ******** \033[0m' && \
  sudo sed -i 's|#PROXYHOST=127.0.0.1|PROXYHOST=127.0.0.1|g' /etc/nikto.conf && \
  sudo sed -i 's|#PROXYPORT=8080|PROXYPORT=8118|g' /etc/nikto.conf

RUN echo -e '\033[36;1m ******* OPENING PORTS ******** \033[0m'
EXPOSE ${PORTS}

RUN echo -e '\033[36;1m ******* CONTAINER START COMMAND ******** \033[0m'
CMD /bin/bash \