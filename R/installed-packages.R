
renv_installed_packages_base <- function() {

  # we can assume that the base set of installed packages won't change during
  # a session, so cache the result of installed.packages()
  # because we are caching the result here we do not need R to cache anymore.
  renv_global("base.packages", {
    packages <- installed.packages(lib.loc = .Library, priority = "base", noCache=TRUE)
    as.data.frame(packages, stringsAsFactors = FALSE)
  })

}

renv_installed_packages <- function(lib.loc = NULL, priority = NULL, ...) {
  packages <- installed.packages(lib.loc = lib.loc, priority = priority, noCache=TRUE, ...)
  as.data.frame(packages, stringsAsFactors = FALSE)
}
