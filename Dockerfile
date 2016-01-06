FROM debian:jessie

ENV PLEX_VERSION 0.9.14.6.1620-e0b7243
ENV PLEX_CHECKSUM 0f243424c2e30ce4af24d268e283d5fab75f9d1f98e85c1f0195e1a0b6c4cf167cf6a2b742010fc665f0cd9f55bb8808e1b6e0f6b916824baa4fabbb0f3fe351

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
