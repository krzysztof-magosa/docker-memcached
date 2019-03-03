#!/bin/sh

exec /usr/bin/memcached \
  -u memcached \
  -p 11211 \
  $([ ${ENABLE_UDP} -eq 1 ] && printf -- '-U 11211') \
  $([ ${ENABLE_SHUTDOWN} -eq 1 ] && printf -- '-A') \
  -m ${MEMORY_LIMIT} \
  $([ ${DISABLE_EVICTIONS} -eq 1 ] && printf -- '-M') \
  -c ${CONNECTIONS_LIMIT} \
  $([ ${LOCK_MEMORY} -eq 1 ] && printf -- '-k') \
  -f ${SLAB_GROWTH_FACTOR} \
  -n ${SLAB_MIN_SIZE} \
  $([ ${ENABLE_LARGEPAGES} -eq 1 ] && printf -- '-L') \
  -D ${DELIMITER} \
  -t ${THREADS} \
  -R ${MAX_REQUESTS_PER_EVENT} \
  $([ ${DISABLE_CAS} -eq 1 ] && printf -- '-C') \
  -b ${LISTEN_BACKLOG} \
  -B ${PROTOCOL} \
  -I ${MAX_ITEM_SIZE} \
  $([ ${ENABLE_SASL} -eq 1 ] && printf -- '-S') \
  $([ ${DISABLE_FLUSH_ALL} -eq 1 ] && printf -- '-F') \
  $([ ${DISABLE_DUMPING} -eq 1 ] && printf -- '-X') \
  $([ -n "${EXTENDED_OPTIONS}" ] && printf -- "-o \"${EXTENDED_OPTIONS}\"")
