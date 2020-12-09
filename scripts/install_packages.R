args = commandArgs(trailingOnly=TRUE)
auth <- args[1]

namespace_packages_stats <- c("car", "coxme", "DescTools", "emmeans", "exact2x2",
                              "lme4", "lmerTest", "mice", "rpact", "survminer")

namespace_packages_util <- c("ggpubr", "viridisLite",  "RColorBrewer", "xtable", "flextable", "kableExtra", "here")

validation_packages <- c("mitml", "optimx", "Exact", "dfoptim", "broom.mixed", "lmtest", "kinship2", "mnormt", "shiny")

pkg_list <- c(namespace_packages_stats, namespace_packages_util, validation_packages)

devtools::install_github("https://github.com/imbi-heidelberg/DescrTab2")
devtools::install_github("https://github.com/imbi-heidelberg/imbiReport", auth_token = auth)
devtools::install_github("https://github.com/pharmaR/riskmetric")


install.packages(pkg_list, dependencies=NA, repos="cran.r-project.org", upgrade=F)



# withr::with_libpaths("/usr/local/lib/R/site-library", devtools::install("/home/rstudio/pkgs/DescrTab2", dependencies=NA, repos="cran.r-project.org", upgrade=F))
# withr::with_libpaths("/usr/local/lib/R/site-library", devtools::install("/home/rstudio/pkgs/imbiReport2", dependencies=NA, repos="cran.r-project.org", upgrade=F))
# withr::with_libpaths("/usr/local/lib/R/site-library", devtools::install("/home/rstudio/pkgs/riskmetric", dependencies=NA, repos="cran.r-project.org", upgrade=F))

sink(paste0("/R-", paste(R.Version()$major, R.Version()$minor, sep  = "."), "/logs/installed_packages.log"))
options(width=9999, max.print = 99999)
installed.packages()
sink()

saveRDS(installed.packages(), "/home/rstudio/pkgs/installed_packages.rds")
