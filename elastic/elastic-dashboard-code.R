rmarkdown::run("elastic-dashboard.Rmd")

library("elastic")
elastic::connect()
index_delete("mtcars")

mtcars$cyl <- mtcars$cyl + 3
docs_bulk(mtcars, "mtcars")
count('mtcars')

mtcars$cyl <- mtcars$cyl + 20
docs_bulk(mtcars, "mtcars")
count('mtcars')
