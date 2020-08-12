FROM imbir:oqbase


COPY scripts /rocker_scripts

RUN Rscript -e 'devtools::install_github("https://github.com/pharmaR/riskmetric")'


CMD ["/init"]