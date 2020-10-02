# sink("/pkgs/installed_packages")

sink(paste0("/R-", paste(R.Version()$major, R.Version()$minor, sep  = "."), "/logs/installed_packages.log"))
options(width=9999, max.print = 99999)
installed.packages()
sink()