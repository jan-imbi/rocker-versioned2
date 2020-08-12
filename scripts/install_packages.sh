#!/bin/bash
set -e

apt-get update && apt-get install jags

mkdir /pkgs
cd /pkgs/

git clone "https://7a2564548f41d164342c4461481ce5bf3454242e@github.com/imbi-heidelberg/imbiReport"
git clone "https://7a2564548f41d164342c4461481ce5bf3454242e@github.com/imbi-heidelberg/DescrTab"

Rscript /rocker_scripts/install_packages.R 2>&1 | tee /R-${R_VERSION}/logs/additional_packages_install.log


for f in *.tar.gz; do tar xf "$f"; done
Rscript /rocker_scripts/get_installed_packages.R
