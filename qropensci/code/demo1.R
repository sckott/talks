## ----eval=FALSE----------------------------------------------------------
## install.packages(c("xml2", "crul", "jsonlite", "rvest"))

## ------------------------------------------------------------------------
library("xml2")
library("rvest")
library("jsonlite")
library("crul")

## ------------------------------------------------------------------------
(index <- xml2::read_html("https://hoytarboretum.gardenexplorer.org/taxalist.aspx"))
res <- rvest::html_nodes(index, "div.content a")
out <- html_attr(res, "href")
out

## ------------------------------------------------------------------------
process_letter_index <- function(x) {
  url <- paste0("https://hoytarboretum.gardenexplorer.org/", x)
  cli <- crul::HttpClient$new(url = url)
  res <- cli$get()
  res$raise_for_status()
  page <- xml2::read_html(res$parse("UTF-8"))
  rvest::html_text(
    rvest::html_nodes(page, "ul.taxalist li span a b")
  )
}

## ------------------------------------------------------------------------
process_letter_index(out[1])[1:5]

## ------------------------------------------------------------------------
lapply(out[1:2], function(z) process_letter_index(z)[1:5])

## ------------------------------------------------------------------------
process_letter_index_detail <- function(x) {
  url <- paste0("https://hoytarboretum.gardenexplorer.org/", x)
  cli <- crul::HttpClient$new(url = url)
  res <- cli$get()
  res$raise_for_status()
  page <- xml2::read_html(res$parse("UTF-8"))
  tmp <- rvest::html_nodes(page, "ul.taxalist li")
  do.call("rbind.data.frame", lapply(tmp, function(z) {
    link_dest <- rvest::html_attr(rvest::html_nodes(z, "a"), "href")
    latin_name <- rvest::html_text(rvest::html_nodes(z, "span a"))
    data.frame(latin_name = latin_name, url = link_dest,
               stringsAsFactors = FALSE)
  }))
}

## ------------------------------------------------------------------------
head(process_letter_index_detail(out[1]))

## ------------------------------------------------------------------------
lapply(out[1:2], function(z) head(process_letter_index_detail(z)))

## ------------------------------------------------------------------------
all_data <- lapply(out, process_letter_index_detail)
all_data_df <- do.call("rbind.data.frame", all_data)
head(all_data_df)

## ------------------------------------------------------------------------
write.csv(all_data_df, "species_names.csv", row.names = FALSE)

## ------------------------------------------------------------------------
tfile <- tempfile(fileext = ".json")
jsonlite::stream_out(all_data_df, file(tfile))
readLines(tfile, n = 10)
head( jsonlite::stream_in(file(tfile)) )

## ------------------------------------------------------------------------
onebigfile <- "onebig.json"
jsonlite::write_json(all_data_df, file(onebigfile))

