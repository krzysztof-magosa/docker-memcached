FROM alpine:latest
MAINTAINER Krzysztof Magosa <me@magosa.dev>

ENV ENABLE_UDP="0" \
    ENABLE_SHUTDOWN="0" \
    MEMORY_LIMIT="64" \
    DISABLE_EVICTIONS="0" \
    CONNECTIONS_LIMIT="1024" \
    LOCK_MEMORY="0" \
    SLAB_GROWTH_FACTOR="1.25" \
    SLAB_MIN_SIZE="48" \
    ENABLE_LARGEPAGES="0" \
    DELIMITER=";" \
    THREADS="4" \
    MAX_REQUESTS_PER_EVENT="20" \
    DISABLE_CAS="0" \
    LISTEN_BACKLOG="1024" \
    PROTOCOL="auto" \
    MAX_ITEM_SIZE="1048576" \
    ENABLE_SASL="0" \
    DISABLE_FLUSH_ALL="0" \
    DISABLE_DUMPING="0" \
    EXTENDED_OPTIONS=""

EXPOSE 11211/tcp \
       11211/udp

RUN apk add memcached dumb-init

COPY start.sh /start.sh

ENTRYPOINT ["/usr/bin/dumb-init", "--"]
CMD ["/start.sh"]

