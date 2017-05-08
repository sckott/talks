## Exercise 1

### Example

Plot x 

```r
install.packages("rplos")
library(rplos)
library(ggplot2)

x <- searchplos(q='ecology', fl='reference', limit = 250)
no_refs <- vapply(x$data$reference, function(z) {
  length(strsplit(z, ";")[[1]])
}, integer(1), USE.NAMES = FALSE)
df <- data.frame(table(no_refs), stringsAsFactors = FALSE)

ggplot(df, aes(x = no_refs, y = Freq)) +
  geom_col() +
  labs(x = "Title lengths", y = "Count") + 
  theme()
```

### Your turn

<details> <summary><strong>Click to expand/collapse</strong></summary><p>

```r
library(rplos)
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
```

![plot](img/rplos.png)

</p></details>

## Exercise 2

```r
install.packages("openadds")
install.packages("leaflet")

library(openadds)
library(leaflet)

# lane county, where Eugene is
search_res <- oa_search(state = "or")
url <- "http://data.openaddresses.io/runs/182942/us/or/lane.zip"
x <- oa_get(url)
x <- x[[1]][sample(seq_len(NROW(x[[1]])), size = 5000), ]

leaflet(x) %>%
   addTiles() %>%
   addCircles(lat = ~LAT, lng = ~LON,
              popup = unname(apply(x[, c('NUMBER', 'STREET')], 1,
              paste, collapse = " ")))
```

![img](img/openadds.png)
