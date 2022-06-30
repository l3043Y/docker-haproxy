FROM haproxy:lts-bullseye
USER root
RUN apt-get update && apt-get install libcap2-bin -y
RUN setcap 'cap_net_bind_service=+ep' /usr/local/sbin/haproxy
COPY ./haproxy.cfg /usr/local/etc/haproxy/haproxy.cfg
USER haproxy
