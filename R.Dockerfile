FROM imbir:texlive-full


ENV TZ=""
COPY scripts /rocker_scripts

RUN /rocker_scripts/install_R.sh

