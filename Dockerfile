FROM debian:bookworm-slim AS base

LABEL maintainer="OpenWrt Builder"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    xz-utils \
    asciidoc \
    bash \
    bc \
    binutils \
    bzip2 \
    flex \
    git \
    g++ \
    gcc \
    time \
    util-linux \
    gawk \
    gzip \
    help2man \
    intltool \
    libelf-dev \
    zlib1g-dev \
    make \
    libncurses5-dev \
    libssl-dev \
    patch \
    perl \
    perl-modules \
    python3-dev \
    python3-setuptools \
    rsync \
    swig \
    tar \
    unzip \
    wget \
    which \
    gettext \
    xsltproc \
    sudo \
    android-sdk-libsparse-utils \
    mkbootimg \
    zstd \
    && rm -rf /var/lib/apt/lists/*

# Create a non-root user for building
RUN useradd -G sudo -m -u 1000 builder

USER builder
WORKDIR /home/builder

FROM base

RUN git clone --revision=b08962bcb724964820a772e42b508f14b673282b --depth=1 https://github.com/lkiuyu/immortalwrt openwrt &&  cd openwrt && \
    ./scripts/feeds update -a && \
    ./scripts/feeds install -a

CMD ["/bin/bash"]
