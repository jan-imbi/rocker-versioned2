FROM ubuntu:20.04

LABEL org.label-schema.license="GPL-2.0" \
      org.label-schema.vcs-url="https://github.com/jan-imbi/rocker-versioned2" \
      org.label-schema.vendor="imbiR" \
      maintainer="Jan Meis <meis@imbi.uni-heidelberg.de>"

ENV R_VERSION=4.0.2
ENV TERM=xterm
ENV LC_ALL=en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV R_HOME=/usr/local/lib/R
ENV CRAN=https://packagemanager.rstudio.com/all/__linux__/focal/latest
ENV TZ=UTC

COPY scripts /rocker_scripts

RUN /rocker_scripts/install_R.sh

ENV S6_VERSION=v1.21.7.0
ENV RSTUDIO_VERSION=latest
ENV PATH=/usr/lib/rstudio-server/bin:$PATH

RUN /rocker_scripts/install_rstudio.sh
RUN /rocker_scripts/install_pandoc.sh

EXPOSE 8787

RUN /rocker_scripts/install_tidyverse.sh

ENV CTAN_REPO=http://mirror.ctan.org/systems/texlive/tlnet
ENV PATH=/usr/local/texlive/bin/x86_64-linux:$PATH


RUN /rocker_scripts/install_verse.sh

CMD ["/init"]
