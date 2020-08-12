FROM imbir:Rstudio


COPY scripts /rocker_scripts

RUN /rocker_scripts/install_packages.sh

CMD ["/init"]