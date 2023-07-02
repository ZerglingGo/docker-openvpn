# syntax=docker/dockerfile:1

FROM alpine:3.18

LABEL org.opencontainers.image.source=https://github.com/ZerglingGo/docker-openvpn
LABEL org.opencontainers.image.description="Dockerized OpenVPN server"
LABEL org.opencontainers.image.licenses=MIT

COPY dist /

RUN apk update \
 && apk add --no-cache openvpn easy-rsa iptables \
 && cp /usr/share/easy-rsa/easyrsa /usr/bin/easyrsa

VOLUME ["/etc/openvpn"]

ENTRYPOINT ["openvpn-start"]
