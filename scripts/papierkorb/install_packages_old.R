pkg_list <- c("mice", "Exact", "Matching", "MatchIt", "lmerTest",
              "netmeta", "meta", "binom",  "pROC", "Hmisc",
               "rpact", "rjags", "dfoptim")

# pkg_list <- c("mice", "Exact", "Matching", "MatchIt", "lme4", "lmerTest", "survminer",
#               "netmeta", "meta", "pwr", "binom", "mvtnorm",  "pROC", "ROCR", "Hmisc",
#               "adoptr", "rpact", "rjags", "kable", "dfoptim", "optimx")

# pkg_list <- "MatchIt"



install.packages("lme4", repos = "cran.r-project.org", upgrade=F)
install.packages("survminer", repos = "cran.r-project.org", upgrade=F)
install.packages("pwr", repos = "cran.r-project.org", upgrade=F)
install.packages("adoptr", repos = "cran.r-project.org", upgrade=F)
install.packages("kableExtra", repos = "cran.r-project.org", upgrade=F)
install.packages("optimx", repos = "cran.r-project.org", upgrade=F)
install.packages("gtools", repos = "cran.r-project.org", upgrade=F)


pkg_paths <- sapply(pkg_list, function(x)paste0("/pkgs/", x))

for (path in pkg_paths){
  quick_ <- F
  if(path %in% c("/pkgs/MatchIt") ){
    quick_ <- T
  }
  
  withr::with_libpaths("/usr/local/lib/R/site-library", devtools::install(path, dependencies=NA, repos="cran.r-project.org",
                                                                           upgrade=F, quick = quick_ ))
}

withr::with_libpaths("/usr/local/lib/R/site-library", devtools::install("/pkgs/DescrTab", dependencies=NA, repos="cran.r-project.org", upgrade=F))
withr::with_libpaths("/usr/local/lib/R/site-library", devtools::install("/pkgs/imbiReport", dependencies=NA, repos="cran.r-project.org", upgrade=F))
withr::with_libpaths("/usr/local/lib/R/site-library", devtools::install("/pkgs/riskmetric", dependencies=NA, repos="cran.r-project.org", upgrade=F))

