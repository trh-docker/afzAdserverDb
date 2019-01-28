FROM quay.io/spivegin/tlmusers AS TLMUSERS



FROM quay.io/spivegin/afzas
WORKDIR /opt/adfree/

RUN mkdir -p /opt/bin/ /opt/adfree/files /opt/adfree/dbDat/dbsql /opt/adfree/dbDat/ssl &&\
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
COPY --from=TLMUSERS /opt/bin/tlmuser /opt/bin/
ADD dockerfiles/bin/* /opt/bin/

ADD https://zinc.tpnfc.us/TLM.crt /etc/ssl/certs/

RUN update-ca-certificates &&\
    chmod +x /opt/bin/main.sh /opt/bin/ads /opt/bin/adfree /opt/bin/adserverdb /opt/bin/tlmuser &&\
    ln -s /opt/bin/adfree /bin/adfree &&\
    ln -s /opt/bin/adserverdb /bin/adserverdb &&\
    ln -s /opt/bin/ads /bin/ads &&\
    ln -s /opt/bin/tlmuser /bin/tlmuser &&\
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV ADSERVER_TEST=false \
    NATS_ADDRESS=tls://nats.example.com \
    NATS_PORT=443 \
    COCKROACH_ADDRESS=crdb.example.com \
    COCKROACH_PORT=26257 \
    COCKROACH_DATABASE=coredns \
    COCKROACH_USER=username \
    ONEPASS=kxFpeiovjqagrAfCc9zhdn7b3mwEyHt4su \
    NATSD_HOST=nats.example.com \
    FE4Hs7uAehidCqpn93az=qE9FpxyA3hsudjH4fica


CMD ["/opt/bin/main.sh"]