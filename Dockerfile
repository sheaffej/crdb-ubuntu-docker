FROM ubuntu:jammy

ARG CRDB_VERSION=v22.2.12

WORKDIR /cockroach

RUN mkdir -p /cockroach

ADD entrypoint.sh /cockroach/
RUN chmod 700 /cockroach/entrypoint.sh
ENTRYPOINT [ "/cockroach/entrypoint.sh" ]

ADD https://binaries.cockroachdb.com/cockroach-${CRDB_VERSION}.linux-amd64.tgz /cockroach/
RUN tar xzvf cockroach-*.linux-amd64.tgz \
    && mv cockroach-*.linux-amd64/* . \
    && rm -Rf cockroach-*.linux-amd64*

EXPOSE 26257/tcp
EXPOSE 8080/tcp
   
