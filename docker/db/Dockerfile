FROM postgres:alpine

COPY ./init-user-db.sh /docker-entrypoint-initdb.d/

#set tz
RUN apk add --no-cache tzdata && \
    rm -rf /tmp/* /var/cache/apk/*
ENV TZ=Australia/Brisbane
