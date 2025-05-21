# FROM --platform=$TARGETPLATFORM scratch
FROM scratch

ARG UOS_BASE
ARG VERSION

ADD ${UOS_BASE} /

RUN apt-get update && apt-get install -y \
    apt-utils \
    apt-transport-https \
    ca-certificates \
    gnupg \
    lsb-release \
    jq \
    curl \
    && apt-get dist-upgrade -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# RUN curl -s "https://shuttle.uniontech.com/api/shuttle/repo/info?type=deb&reponame=eagle-${VERSION}" | jq -r '.data.repobase.archives[].address' | tee /etc/apt/sources.list
#
# RUN echo deb [trusted=yes] https://aptly.uniontech.com/pkg/eagle-1071/release-candidate/56qX566h5b2S5LiA54mI5pys5o-Q5rWLMjAyNS0wNS0xOSAxMDo1MTo1NA/ unstable main >> /etc/apt/sources.list

RUN apt-get update && apt-get install -y \
    clangd-13 \
    ninja-build \
    # qt5-default \
    # qtwayland5-private-dev \
    && apt-get dist-upgrade -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN update-alternatives --install /usr/bin/clangd clangd /usr/bin/clangd-13 13
