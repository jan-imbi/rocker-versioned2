pkg_list <- c("mice", "Exact", "MatchIt", "lmerTest", "survminer",
              "netmeta", "meta", "pwr", "binom", "mvtnorm", "Matching", "pROC", "ROCR", "Hmisc",
              "adoptr", "rpact", "rjags", "kable", "dfoptim", "optimx")

pkg_paths <- sapply(pkg_list, function(x)paste0("/pkgs/", x))

for (path in pkg_paths){
  devtools::install(path, dependencies=TRUE, repos="cran.r-project.org")
}

devtools::install("/pkgs/DescrTab", dependencies=TRUE, repos="cran.r-project.org")
devtools::install("/pkgs/imbiReport", dependencies=TRUE, repos="cran.r-project.org")