# install.packages("rplos")

x <- searchplos(q='ecology', fl='author', limit = 1000)
x
x$data
x$data$author
auth_split <- vapply(x$data$author, function(x) {
  length(strsplit(x, split = ";")[[1]])
}, integer(1), USE.NAMES = FALSE)
df <- data.frame(table(auth_split), stringsAsFactors = FALSE)

library(ggplot2)

ggplot(df, aes(x = auth_split, y = Freq)) +
  geom_col() +
  labs(x = "Number of authors", y = "Count")

![plot](img/rplos.png)
