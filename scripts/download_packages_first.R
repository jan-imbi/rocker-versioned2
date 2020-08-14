pkg_list <- c("mice", "lme4", "lmerTest", "survminer", "binom", "rpact", "kableExtra")

download.packages(pkg_list, destdir = "/pkgs", repos = "https://cran.r-project.org/", type = "source")
