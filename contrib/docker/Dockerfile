# 611 (SixEleven) dnsseed docker image

FROM debian:jessie

MAINTAINER Florian Fuessl <flo@degnet.de>
ENV REFRESHED_AT 20161010

# grab the latest dnsseed-611 source code from git, compile, install and clean up
RUN set -ex \
	&& apt-get update \

	# install dependencies
	&& apt-get install -y --no-install-recommends ca-certificates wget \
		build-essential libssl-dev libboost-all-dev git \

	# compile and install dnsseed-611
	&& cd /usr/src \
	&& git clone https://github.com/fflo/sixeleven-dnsseed.git sixeleven-dnsseed \
	&& cd sixeleven-dnsseed \
	&& make \
	&& cp dnsseed /usr/local/bin/dnsseed-611 \
	&& strip /usr/local/bin/dnsseed-611 \

	# cleanup
	&& cd ~ && rm -rf /usr/src/sixeleven-dnsseed \
	&& apt-get -y purge build-essential libssl-dev libboost-all-dev git \
	&& apt-get -y autoremove \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/*

ENV SIXELEVEN_DATA /sixeleven
RUN mkdir $SIXELEVEN_DATA
VOLUME ["/sixeleven"]
WORKDIR /sixeleven

COPY docker-entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 53/udp
CMD ["dnsseed-611"]
