FROM ubuntu
RUN apt update && apt install -y wget
WORKDIR /tmp
RUN wget https://github.com/fatedier/frp/releases/download/v0.39.0/frp_0.39.0_linux_arm64.tar.gz
RUN tar -zxf frp_0.39.0_linux_arm64.tar.gz
RUN mv frp_0.39.0_linux_arm64.tar.gz /var/frp
RUN rm -rf /var/frp/frps.ini
RUN wget http://www.xinsite.top/frps.txt
RUN mv frps.ini /var/frp/frps.ini
RUN apt remove -y wget
RUN apt autoremove -y
RUN rm -rf /var/lib/apt/lists/*
ENTRYPOINT /var/frp/frps -c /var/frp/frps.ini
EXPOSE 80 443 2000-65535
