library(rmarkdown)
library(testthat)

watchr <- function(path){
  # the path supplied here can just be something like "./"
  # taken from auto-test.r
  knit_it <- function(added, deleted, modified) {
    changed <- normalizePath(c(added, modified))
    for (a_file in changed) rmarkdown::render(a_file)
    TRUE
  }
  watch(path, knit_it, ".Rmd")
}

watchr('.')
