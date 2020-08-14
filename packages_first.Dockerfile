FROM imbir:Rstudio

ARG AUTH_TOKEN

COPY scripts /rocker_scripts

RUN /rocker_scripts/install_packages_first.sh



CMD ["/init"]