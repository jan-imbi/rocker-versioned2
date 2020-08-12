install.packages(c("mice", "Exact", "MatchIt", "lmerTest", "survminer",
                   "netmeta", "meta", "pwr", "binom", "mvtnorm", "Matching", "pROC", "ROCR", "Hmisc",
                   "adoptr", "rpact", "rjags", "kable", "dfoptim", "optimx"),
                 destdir = "/pkgs/", repos = "https://cran.r-project.org/", type = "source")


devtools::install("/pkgs/DescrTab", dependencies=TRUE, repos="cran.r-project.org")
devtools::install("/pkgs/imbiReport", dependencies=TRUE, repos="cran.r-project.org")