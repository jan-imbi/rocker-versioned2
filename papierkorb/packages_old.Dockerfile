FROM imbir:Rstudio

ARG AUTH_TOKEN

COPY scripts /rocker_scripts

RUN apt-get update && apt-get install acl -y
RUN mkdir /pkgs
RUN setfacl -R -m u:rstudio:rwx /pkgs
RUN setfacl -R -m u:rstudio:rwx /R-${R_VERSION}
RUN setfacl -R -m u:rstudio:rwx /tmp

RUN /rocker_scripts/install_packages.sh

RUN Rscript -e 'saveRDS(installed.packages(), "/pkgs/installed_packages.rds")'

CMD ["/init"]