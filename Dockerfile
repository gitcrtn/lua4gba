FROM devkitpro/devkitarm:latest
RUN mkdir /work \
    && cd /work \
    && git clone https://github.com/devkitPro/gba-tools.git \
    && cd gba-tools \
    && buildDeps='build-essential autoconf automake' \
    && set -x \
    && apt-get update \
    && apt-get install -y $buildDeps --no-install-recommends \
    && rm -rf /var/lib/apt/lists/* \
    && ./autogen.sh \
    && ./configure \
    && make \
    && mkdir /opt/gba-tools \
    && cp gbafix gbalzss gbfs insgbfs lsgbfs ungbfs /opt/gba-tools \
    && apt-get purge -y --auto-remove $buildDeps \
    && cd / \
    && rm -rf /work
ENV PATH /opt/gba-tools:$PATH
RUN cd /opt \
    && git clone https://github.com/bkacjios/lua4gba.git \
    && cd lua4gba \
    && chmod +x build.sh \
    && ./build.sh \
    && rm -rf filesystem lua52.gba filesystem.gbfs
COPY build.sh /
ENTRYPOINT ["/build.sh"]
