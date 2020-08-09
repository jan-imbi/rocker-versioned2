FROM imbir:R-base


ENV CRAN=https://packagemanager.rstudio.com/all/__linux__/focal/latest


ENV S6_VERSION=v1.21.7.0
ENV RSTUDIO_VERSION=latest
ENV PATH=/usr/lib/rstudio-server/bin:$PATH

COPY scripts /rocker_scripts

RUN /rocker_scripts/install_rstudio.sh
RUN /rocker_scripts/install_pandoc.sh

EXPOSE 8787

RUN /rocker_scripts/install_tidyverse.sh

CMD ["/init"]