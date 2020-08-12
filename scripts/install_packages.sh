#!/bin/bash
set -e

apt-get update && apt-get install jags

mkdir /pkgs
cd /pkgs/

git clone "https://d5f451b56775c51571a46002a24180d32cf2307a@github.com/imbi-heidelberg/imbiReport"
git clone "https://github.com/imbi-heidelberg/DescrTab"

Rscript /rocker_scripts/download_packages.R
for f in *.tar.gz; do tar xf "$f"; done
Rscript /rocker_scripts/install_packages.R 2>&1 | tee /R-${R_VERSION}/logs/additional_packages_install.log
Rscript /rocker_scripts/get_installed_packages.R
