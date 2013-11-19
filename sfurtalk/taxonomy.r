## Taxonomy

library(taxize)

### Check name spelling

mynames <- c("Helianthus annus", "Poa anua", "Pinus contort")
out <- tnrs(query = mynames, source="iPlant_TNRS")
out[,c(1:5)]

### Get synonyms

synonyms(c("Poa annua",'Pinus contorta','Puma concolor'), db="itis")

out <- get_ids(names="Poa annua", db = c('itis','tropicos'))
synonyms(out)

### Common names from scientific names

sci2comm(scinames=c('Helianthus annuus','Poa annua'))

### Scientific from common names

out <- comm2sci(commnames=c('annual blue grass','tree of heaven'), db='tropicos')
library(plyr)
df <- ldply(out)
df[,c(1:3)]

### Taxonomic hierarchies

out <- get_ids(names="Poa annua", db = c('ncbi','itis','col','eol','tropicos'))
classification(out)