FROM debian:jessie

ENV PLEX_VERSION 0.9.16.6.1993-5089475
#ENV PLEX_CHECKSUM xxxx

RUN apt-get update \
	&& apt-get install -y wget \
	&& wget -O /tmp/plexmediaserver.deb \
		"https://downloads.plex.tv/plex-media-server/${PLEX_VERSION}/plexmediaserver_${PLEX_VERSION}_amd64.deb" \
	&& dpkg -i /tmp/plexmediaserver.deb \
	&& rm -f /tmp/plexmediaserver.deb \
	&& rm -rf /var/lib/apt/lists/*

#	&& echo "${PLEX_CHECKSUM} /tmp/plexmediaserver.deb" | sha512sum -c \

COPY docker-entrypoint.sh /entrypoint.sh
COPY plex /usr/local/bin/

EXPOSE 32400
VOLUME /plex

ENTRYPOINT ["/entrypoint.sh"]
CMD ["plex"]
