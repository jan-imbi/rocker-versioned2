pkg_list <- c("mice", "Exact", "MatchIt", "lme4", "lmerTest", "survminer",
              "netmeta", "meta", "pwr", "binom", "mvtnorm", "Matching", "pROC", "ROCR", "Hmisc",
              "adoptr", "rpact", "rjags", "kable", "dfoptim", "optimx")

# pkg_list <- "MatchIt"

download.packages(pkg_list, destdir = "/pkgs", repos = "https://cran.r-project.org/", type = "source")
