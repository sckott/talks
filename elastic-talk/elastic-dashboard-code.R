mtcars$cyl <- mtcars$cyl + 3
mtcars$cyl <- mtcars$cyl + 20
docs_bulk(mtcars, "mtcars")
count('mtcars')
