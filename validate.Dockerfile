FROM imbir:oqbase


COPY scripts /rocker_scripts

RUN Rscript -e 'devtools::install_github("https://github.com/pharmaR/riskmetric")'
RUN Rscript -e 'saveRDS(installed.packages(), "/pkgs/installed_packages.rds")'


CMD ["/init"]