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

RUN git clone --depth=1 https://github.com/lkiuyu/immortalwrt openwrt

# Restoring default feeds.
COPY feeds.conf.default openwrt/

RUN openwrt/scripts/feeds update -a && \
    openwrt/scripts/feeds install -a

# Adding my customizations.
COPY image_msm8916.mk openwrt/target/linux/msm89xx/image/msm8916.mk
COPY extra_msm8916.sh openwrt/
RUN chmod +x openwrt/extra_msm8916.sh &&\
    openwrt/extra_msm8916.sh

CMD ["/bin/bash"]
