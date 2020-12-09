FROM ubuntu:20.04

LABEL org.label-schema.license="GPL-2.0" \
      org.label-schema.vcs-url="https://github.com/jan-imbi/rocker-versioned2" \
      org.label-schema.vendor="imbiR" \
      maintainer="Jan Meis <meis@imbi.uni-heidelberg.de>"


RUN apt-get -qq update && \
    apt-get -q -y upgrade && \
    apt-get install -y sudo curl wget locales && \
    rm -rf /var/lib/apt/lists/*

RUN locale-gen en_US.UTF-8 
	
ENV R_VERSION=4.0.3
ENV TERM=xterm
ENV LC_ALL=en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en
ENV LC_TIME=C
ENV LC_COLLATE=C
ENV R_HOME=/usr/local/lib/R
ENV CRAN=https://packagemanager.rstudio.com/all/__linux__/focal/latest
ENV TZ=UTC
ARG DEBIAN_FRONTEND=noninteractive

RUN export PATH=$PATH:/usr/local/texlive/bin/x86_64-linux/

RUN apt-get update -qq \
  && apt-get install -y --no-install-recommends \
    cmake \
    curl \
    default-jdk \
    fonts-roboto \
    ghostscript \
    hugo \
    less \
    libbz2-dev \
    libglpk-dev \
    libgmp3-dev \
    libhunspell-dev \
    libicu-dev \
    liblzma-dev \
    libmagick++-dev \
    libopenmpi-dev \
    libpcre2-dev \
    libssl-dev \
    libv8-dev \
    libxml2-dev\
    libxslt1-dev \
    libzmq3-dev \
    lsb-release \
    qpdf \
    texinfo \
    software-properties-common \
    vim \
    wget

RUN apt-get install -y libgit2-dev libcurl4-openssl-dev
RUN apt-get update && apt-get install texlive texlive-full -y --no-install-recommends