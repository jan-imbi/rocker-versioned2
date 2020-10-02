FROM janmeisimbi/imbir:packages_first

ARG AUTH_TOKEN

COPY scripts /rocker_scripts

RUN chown -R rstudio: /home/rstudio/pkgs
RUN chmod -R u+w /home/rstudio/pkgs

VOLUME /home/rstudio



CMD ["/init"]