pkg_list <- c("mice", "Exact", "MatchIt", "lmerTest", "survminer",
              "netmeta", "meta", "pwr", "binom", "mvtnorm", "Matching", "pROC", "ROCR", "Hmisc",
              "adoptr", "rpact", "rjags", "kable", "dfoptim", "optimx")

download.packages(pkg_list, destdir = "/pkgs/", repos = "https://cran.r-project.org/", type = "source")
