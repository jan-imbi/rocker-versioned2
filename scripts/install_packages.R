

pkg_list <- c(c("mice", "lme4", "lmerTest","survminer", "rpact", "Exact", "DescTools", "xtable", "flextable", "kableExtra"),
              c("mitml", "optimx", "dfoptim", "broom.mixed", "lmtest"))

install.packages(pkg_list, dependencies=NA, repos="cran.r-project.org", upgrade=F)
withr::with_libpaths("/usr/local/lib/R/site-library", devtools::install("/home/rstudio/pkgs/DescrTab", dependencies=NA, repos="cran.r-project.org", upgrade=F))
withr::with_libpaths("/usr/local/lib/R/site-library", devtools::install("/home/rstudio/pkgs/imbiReport", dependencies=NA, repos="cran.r-project.org", upgrade=F))
withr::with_libpaths("/usr/local/lib/R/site-library", devtools::install("/home/rstudio/pkgs/riskmetric", dependencies=NA, repos="cran.r-project.org", upgrade=F))

sink(paste0("/R-", paste(R.Version()$major, R.Version()$minor, sep  = "."), "/logs/installed_packages.log"))
options(width=9999, max.print = 99999)
installed.packages()
sink()

saveRDS(installed.packages(), "/home/rstudio/pkgs/installed_packages.rds")
