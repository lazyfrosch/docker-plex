FROM debian:jessie

ENV PLEX_VERSION 0.9.16.3.1840-cece46d
ENV PLEX_CHECKSUM 371d9fd6cde3c70121098c2ff752b6b63870382051259be8be88adc7eca3a5e484c65789cb916852e673d253b7dc955349f2dce60ae2eaaef233d71ead11f5f8

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
