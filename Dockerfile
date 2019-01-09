FROM lsiobase/alpine.python

RUN \
	echo "**** git clone klive ****" && \
	apk add --no-cache git py-gevent && \
	git clone https://github.com/soju6jan/Klive.git /tmp/Klive && \
	cd /tmp/Klive && mv lib/ klive_server/ && mv klive_server / && \
	pip install flask requests && \
	echo "**** cleanup ****" && \
	rm -rf \
		/tmp/* \
		/root/.cache

COPY root/ /
RUN chmod a+x /usr/bin/klive_setup

# ports and volumes
EXPOSE 9801
VOLUME /config
WORKDIR /config
