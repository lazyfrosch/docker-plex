FROM debian:jessie

ENV PLEX_VERSION 0.9.15.2.1663-7efd046
ENV PLEX_CHECKSUM 05b4614359d99ed49bc1cea0926a65ebfc98a094cdd67e2e331ab159e46ee192d6c6d6f04ddbc72c633aeb525be8dd5852104ba950db46c92feb054fd0aaad17

RUN apt-get update \
	&& apt-get install -y wget \
	&& wget -O /tmp/plexmediaserver.deb \
		"https://downloads.plex.tv/plex-media-server/${PLEX_VERSION}/plexmediaserver_${PLEX_VERSION}_amd64.deb" \
	&& echo "${PLEX_CHECKSUM} /tmp/plexmediaserver.deb" | sha512sum -c \
	&& dpkg -i /tmp/plexmediaserver.deb \
	&& rm -f /tmp/plexmediaserver.deb \
	&& rm -rf /var/lib/apt/lists/*

COPY docker-entrypoint.sh /entrypoint.sh
COPY plex /usr/local/bin/

EXPOSE 32400
VOLUME /plex

ENTRYPOINT ["/entrypoint.sh"]
CMD ["plex"]
