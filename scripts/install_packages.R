# pkg_list <- c("mice", "Exact", "Matching", "MatchIt", "lmerTest",
#               "netmeta", "meta", "binom",  "pROC", "Hmisc",
#               "adoptr", "rpact", "rjags", "kable", "dfoptim", "optimx")

# pkg_list <- c("mice", "Exact", "Matching", "MatchIt", "lme4", "lmerTest", "survminer",
#               "netmeta", "meta", "pwr", "binom", "mvtnorm",  "pROC", "ROCR", "Hmisc",
#               "adoptr", "rpact", "rjags", "kable", "dfoptim", "optimx")

# pkg_list <- "MatchIt"

pkg_list <- c("Matching", "pROC", "Hmisc",
              "adoptr", "rpact", "rjags", "kable", "dfoptim", "optimx")

# install.packages("lme4", repos = "cran.r-project.org")
# install.packages("survminer", repos = "cran.r-project.org")
# install.packages("pwr", repos = "cran.r-project.org")

pkg_paths <- sapply(pkg_list, function(x)paste0("/pkgs/", x))

for (path in pkg_paths){
  quick_ <- F
  if(path %in% c("/pkgs/MatchIt") ){
    quick_ <- T
  }
  
  withr::with_libpaths("/usr/local/lib/R/site-library", devtools::install(path, dependencies=NA, repos="cran.r-project.org",
                                                                           upgrade=F, quick = quick_ ))
}

# withr::with_libpaths("/usr/local/lib/R/site-library", devtools::install("/pkgs/DescrTab", dependencies=NA, repos="cran.r-project.org", upgrade=F))
# withr::with_libpaths("/usr/local/lib/R/site-library", devtools::install("/pkgs/imbiReport", dependencies=NA, repos="cran.r-project.org", upgrade=F))
# withr::with_libpaths("/usr/local/lib/R/site-library", devtools::install("/pkgs/riskmetric", dependencies=NA, repos="cran.r-project.org", upgrade=F))
# 
