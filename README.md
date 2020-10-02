[![license](https://img.shields.io/badge/license-GPLv2-blue.svg)](https://opensource.org/licenses/GPL-2.0)
Visit [rocker-project.org](https://rocker-project.org) for more about available Rocker images, configuration, and use. 


## Modified Rocker images for R 4.0.2 for imbi usage

These dockerimages are modifications of the images from https://github.com/rocker-org/rocker-versioned2.
The corresponding Docker images are hosted on https://hub.docker.com/r/janmeisimbi/imbir.

The basic structure is hierarchical:


tex < R < Rstudio < packages < oqbase < production

You can compile everything in order using the docker-compose instructions:

``` docker
docker-compose build --build-arg AUTH_TOKEN=<auth token with full access to https://github.com/imbi-heidelberg>
```


tex.Dockerfile installs texlive-full via apt-get. texlive-full is needed to pass all the tests in the operational qualificaion (oqbase). I can't get this to work with a slimmer tex distribution. The rocker project installs tex after compiling R, but we do it the other way around.


R.Dockerfile compiles R from source. There is a slight modification from the rocker image: The R source directory is not deleted after compilation is finished, and the make log is saved. Also one line from the operational test files is commented out, because the LAPACK version we are using does not produce an error in a specific scenario where old LAPACK versions would produce one (the specific line expects that this error occurrs).

Rstudio.Dockerfile installs Rstudio + tidyverse. This is nearly unmodified compared to the rocker project. The only difference is that tex installation is ommited (because we already installed it).

packages.Dockerfile installs all addtional packages required for our work and for the validation process, and saves logs of the installation process. Packages are installed from github (our own packages) and from cran (most other packages). On top of this, the soucrce code for all installed packages is downloaded for inspection in the validation process.

oqbase.Dockerfile performs the tests in R-4.0.2/tests, via the command make check-all and saves the logs of the outcomes. This is not done in the rocker project at all.

production.Dockerfile removes some of files which were used in the validation process to reduce unnecessary bloat of the image.

Most of the instructions are not directly documented inside the Dockerfile. Instead, a script is copied inside the container at compile time that containts the necessary instructions, e.g. "scripts/install_packages.sh". These scripts are more comfortable to write than Dockerfile instructions, because you dont have to type "RUN" before every command. Other than that, there is no real benefit.




