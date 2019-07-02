url <- "https://raw.githubusercontent.com/ropenscilabs/ropensci_citations/master/citations.tsv"
df <- readr::read_tsv(url)
df
library(dplyr)
df %>% filter(name == "rentrez")

df %>% 
    group_by(name) %>% 
    summarise(count_by_package = n()) %>% 
    arrange(desc(count_by_package)) %>% 
    head(20)

library(ggplot2)

tax = c("taxize",
"rentrez",
"rotl",
"worrms",
"ritis",
"taxa")

occ = c("rgbif",
"rfishbase",
"spocc",
"rredlist",
"rfisheries",
"rvertnet",
"CoordinateCleaner")

env = c("rnoaa",
"rerddap",
"riem",
"weathercan",
"bomrang",
"clifro",
"GSODR",
"nasapower",
"getCRUCLdata",
"hydroscoper")

df_new <- bind_rows(
    taxonomy = df %>% filter(name %in% tax) %>% select(name),
    occurence = df %>% filter(name %in% occ) %>% select(name),
    environment = df %>% filter(name %in% env) %>% select(name),
    .id = "type"
) %>% group_by(type, name) %>% summarise(count = n())

ggplot(df_new, aes(reorder(name, count), count)) + 
    geom_bar(aes(fill = type), position = "dodge", stat="identity") +
    labs(x = "", y = "citations") +
    theme(
        axis.text.x = element_text(angle = 45, hjust = 1),
        legend.position = c(0.2, 0.8),
        panel.background = element_blank()
    )
ggsave("img/citation.png")
