
## Functions ---------------------------------------------------------------

# Function to check and install packages if they are not already installed
load_install_pkgs <- function(package_names) {
  for (package in package_names) {
    if (!require(package, character.only = TRUE)) {
      install.packages(package)
      print(paste("Installing", package))
      library(package, character.only = TRUE)
    }
  }
}

# Backward-compatible alias used in workshop notes.
packages_load <- load_install_pkgs


## Variables ---------------------------------------------------------------
data_dir <- "data"
