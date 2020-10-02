FROM janmeisimbi/imbir:oqbase


COPY scripts /rocker_scripts

RUN rm -rf /tmp/*
RUN rm -rf R-${R_VERSION}
RUN rm -rf R-${R_VERSION}.tar.gz
RUN apt-get autoremove -y
RUN apt-get autoclean -y
RUN rm -rf /var/lib/apt/lists/*


CMD ["/init"]