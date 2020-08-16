FROM janmeisimbi/imbir:Rstudio

ARG AUTH_TOKEN

RUN mkdir /home/rstudio/pkgs

RUN chown -R rstudio /home/rstudio/pkgs
RUN chmod -R 777 /home/rstudio/pkgs



COPY scripts /rocker_scripts
RUN /rocker_scripts/install_packages.sh

USER rstudio
RUN cd /home/rstudio/pkgs && \
	Rscript /rocker_scripts/download_packages.R && \
	for f in *.tar.gz; do tar xf "$f"; done && \
	rm *.tar.gz
	
USER root

CMD ["/init"]