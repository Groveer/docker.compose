FROM --platform=$TARGETPLATFORM scratch

ARG TARGETARCH
ARG UOS_BASE
ARG UOS_SOURCE

ADD ${UOS_BASE} /

# deb [trusted=yes] http://pools.uniontech.com/desktop-professional eagle/1070 main contrib non-free
# deb [trusted=yes] http://pools.uniontech.com/desktop-professional-V25 snipe main community commercial
RUN echo "${UOS_SOURCE}" > /etc/apt/sources.list

RUN apt-get update && apt-get install -y \
    apt-utils \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release \
    && apt-get dist-upgrade -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

CMD [ "bash" ]

