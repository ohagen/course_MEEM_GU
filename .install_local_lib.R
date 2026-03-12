lib <- normalizePath('.r_libs', winslash='/', mustWork=FALSE)
.libPaths(c(lib, .libPaths()))
install.packages(c('rlang','caret'), lib=lib, repos='https://cloud.r-project.org', dependencies=TRUE)
