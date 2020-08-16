base <- installed.packages()[installed.packages()[,4] %in% c("base", "recommended"),1]
pkgs_without_base <- installed.packages()[!(installed.packages()[,1] %in% base),1]
download.packages(pkgs_without_base, destdir = "/home/rstudio/pkgs", repos = "cran.r-project.org")