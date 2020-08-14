pkg_list <- c("mice", "lme4", "lmerTest", "optimx", "dfoptim", "survminer", "binom", "rpact")

install.packages(pkg_list, dependencies=NA, repos="cran.r-project.org", upgrade=F)
withr::with_libpaths("/usr/local/lib/R/site-library", devtools::install("/home/rstudio/pkgs/DescrTab", dependencies=NA, repos="cran.r-project.org", upgrade=F))
withr::with_libpaths("/usr/local/lib/R/site-library", devtools::install("/home/rstudio/pkgs/imbiReport", dependencies=NA, repos="cran.r-project.org", upgrade=F))
withr::with_libpaths("/usr/local/lib/R/site-library", devtools::install("/home/rstudio/pkgs/riskmetric", dependencies=NA, repos="cran.r-project.org", upgrade=F))

base <- installed.packages()[installed.packages()[,4] %in% c("base", "recommended"),1]
pkgs_without_base <- installed.packages()[!(installed.packages()[,1] %in% base),1]
download.packages(pkgs_without_base, destdir = "/home/rstudio/pkgs", repos = "cran.r-project.org")


sink(paste0("/R-", paste(R.Version()$major, R.Version()$minor, sep  = "."), "/logs/installed_packages.log"))
options(width=9999, max.print = 99999)
installed.packages()
sink()

saveRDS(installed.packages(), "/home/rstudio/pkgs/installed_packages.rds")
