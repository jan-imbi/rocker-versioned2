#!/bin/bash
set -e

apt-get update && apt-get install jags

mkdir /pkgs
cd /pkgs/

git clone "https://${AUTH_TOKEN}@github.com/imbi-heidelberg/imbiReport"
git clone "https://github.com/imbi-heidelberg/DescrTab"
git clone "https://github.com/pharmaR/riskmetric"

# wget -P /pkgs https://cran.r-project.org/src/contrib/Archive/WhatIf/WhatIf_1.5-9.tar.gz
# wget -P /pkgs https://cran.r-project.org/src/contrib/Archive/Zelig/Zelig_5.1.6.1.tar.gz

Rscript /rocker_scripts/download_packages.R
for f in *.tar.gz; do tar xf "$f"; done
Rscript /rocker_scripts/install_packages.R 2>&1 | tee /R-${R_VERSION}/logs/additional_packages_install.log
Rscript /rocker_scripts/get_installed_packages.R
