FROM imbir:Rstudio

ARG AUTH_TOKEN

COPY scripts /rocker_scripts

RUN /rocker_scripts/install_packages.sh

RUN Rscript -e 'saveRDS(installed.packages(), "/pkgs/installed_packages.rds")'

CMD ["/init"]