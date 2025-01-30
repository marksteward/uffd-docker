FROM debian:bookworm as uffd

RUN apt-get update && \
    apt-get -y install ca-certificates && \
    rm -rf /var/lib/apt/lists/*

COPY cccv-archive-key.gpg /etc/apt/trusted.gpg.d/
COPY cccv-archive-bookworm.list /etc/apt/sources.list.d/

RUN apt-get update && \
    apt-get -y install uffd sqlite3 vim && \
    rm -rf /var/lib/apt/lists/*

COPY run-uffd.sh /root

FROM jonasal/nginx-certbot as nginx

COPY --from=uffd /usr/share/uffd/uffd/static /usr/share/uffd/uffd/static

