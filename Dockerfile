FROM pihole/pihole:latest

RUN apt update && apt install -y unbound
COPY unbound-pihole.conf /etc/unbound/unbound.d/pihole.conf

ENV DNS1=127.0.0.1#5335
ENV DNS2=127.0.0.1#5335

COPY start-wrapper.sh .

RUN chmod +x start-wrapper.sh
ENTRYPOINT ["./start-wrapper.sh"]