# get pkgs
library("rostats")
library("ropkgs")
library("dplyr")
library("ggplot2")

url <- "https://raw.githubusercontent.com/ropensci/roregistry/gh-pages/registry.json"
df <- jsonlite::fromJSON(url)
pkgs <- tbl_df(df$packages) %>%
  filter(on_cran | on_bioc) %>%
  .$name
sort(pkgs)


# staff
# staff <- c("Ooms", "Chamberlain", "Boettiger", "Ram", "Salmon")
staff <- c("sckott", "karthik", "cboettig", "jeroenooms", "jeroen", "maelle")


# commits
# file: /Users/sckott/Library/Caches/R/rostats/commits/github_commits_2019-07-01.csv
source("helpers.R")
lab <- function() labs(x = "May 2011 to June 2019", y = "Cumulative Code Contributions")
cum_commits() + lab()
ggsave("img/code_contributions_all.png")
cum_commits_split2(staff = staff)
ggsave("img/code_contributions_staff_vs_community.png")


# downloads
## prep
dat <- dplyr::tbl_df(rostats::get_cran(NULL))
dat <- dplyr::bind_rows(lapply(split(dat, dat$package), function(z) {
    pkg <- z$package[1]
    z <- dplyr::group_by(z, date)
    z <- dplyr::summarise(z, count = sum(count))
    z <- dplyr::mutate(z, cumsum = cumsum(count))
    z$package <- pkg
    z
}))
dat <- dat %>% 
  group_by(package) %>% 
  arrange(desc(cumsum)) %>% 
  summarise(val = max(cumsum)) %>% 
  ungroup() %>%
  arrange(desc(val))
# sums <- sort(vapply(split(dat, dat$package), function(z) z[NROW(z),
#     "cumsum"][[1]], 1), decreasing = TRUE)
# dat <- dplyr::filter(dat, package %in% names(sums[1:top_n]))
## plot
ggplot(dat[1:15,], aes(reorder(package, val), val)) + 
  geom_bar(stat = 'identity') + 
  coord_flip() + 
  labs(x = "", y = "no. downloads (rstudio cran mirror)")
ggsave("img/pkgs_downloads.png")



# citations
## prep
library(jsonlite)
cit <- fromJSON("https://github.com/ropenscilabs/ropensci_citations/raw/master/citations_used.json")
cit_df <- tbl_df(cit) %>% 
  group_by(name) %>%
  summarise(citations = length(name)) %>% 
  ungroup() %>% 
  arrange(desc(citations))
## plot
ggplot(cit_df[1:20,], aes(reorder(name, citations), citations)) + 
  geom_bar(stat = 'identity') + 
  coord_flip() + 
  labs(x = "", y = "no. citations")
ggsave("img/pkgs_citations.png")



# dependencies
library(dplyr)
cran <- tools::CRAN_package_db()
cran <- cran[, -dplyr::first(which(names(cran) == "MD5sum"))]
## remove non-cran pkgs
non_cran <- c("genbankr", "treeio")
pkgs <- pkgs[!pkgs %in% non_cran]
cran_deps <- function(pkg) {
  z <- filter(cran, Package == pkg)
  df <- select(z, c("Package", "Reverse depends", "Reverse imports", "Reverse suggests"))
  names(df) <- gsub("\\s", "_", tolower(names(df)))
  df$total <- sum(
    length(na.omit(strsplit(df$reverse_depends, ",")[[1]])),
    length(na.omit(strsplit(df$reverse_imports, ",")[[1]])),
    length(na.omit(strsplit(df$reverse_suggests, ",")[[1]]))
  )
  df
}
# cran_deps(pkgs[97])
reverse_deps <- tbl_df(bind_rows(lapply(pkgs, cran_deps))) %>% arrange(desc(total))
reverse_deps_15 <- reverse_deps[1:15,]
library(ggplot2)
ggplot(reverse_deps_15, aes(reorder(package, total), total)) + 
  geom_bar(stat = 'identity') + 
  coord_flip() + 
  labs(x = "", y = "no. reverse dependencies")
ggsave("img/pkgs_reverse_deps.png")




# thematic areas
url <- "https://raw.githubusercontent.com/ropensci/roregistry/gh-pages/registry.json"
df <- jsonlite::fromJSON(url)
pkgs <- tbl_df(df$packages)



# maintainers per pkg
library(dplyr)
cran <- tools::CRAN_package_db()
cran <- cran[, -dplyr::first(which(names(cran) == "MD5sum"))]
cran <- tbl_df(cran)
cran <- select(cran, Package, Author) %>% filter(Package %in% pkgs)
cran$authors <- unname(vapply(cran$Author, function(z) length(strsplit(z, "\n")[[1]]), 1))
cran <- arrange(cran, desc(authors))
summary(cran$authors)
ggplot(cran, aes(x = authors)) +
    geom_density() +
    geom_vline(xintercept = 2, color = "blue") + 
    theme_grey(base_size = 18)
ggsave("img/maintainers_per_pkg.png")
