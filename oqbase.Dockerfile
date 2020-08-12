FROM imbir:packages


COPY scripts /rocker_scripts

RUN /rocker_scripts/OQ_R.sh

CMD ["/init"]