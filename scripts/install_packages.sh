#!/bin/bash
set -e

apt-get update && apt-get install jags

#mkdir /home/rstudio/pkgs
cd /home/rstudio/pkgs

# git clone "https://${AUTH_TOKEN}@github.com/imbi-heidelberg/imbiReport"
# git clone "https://github.com/imbi-heidelberg/DescrTab2"
# git clone "https://github.com/pharmaR/riskmetric"

Rscript /rocker_scripts/install_packages.R ${AUTH_TOKEN} 2>&1 | tee /R-${R_VERSION}/logs/IQ_additional_packages.log


