## Biodiversity

### Install

# install_github("rgbif", "ropensci")
library(rgbif)

### Get occurrence data

key <- name_backbone(name='Oncorhynchus tshawytscha', kingdom='animals')$speciesKey
dat <- occ_search(taxonKey=key, georeferenced=TRUE, country="CA")
dat$meta
dat$hierarchy[[1]]
dat$data

### Search across all sources

# install_github("spocc", "ropensci")
library(spocc)

out <- occ(query='Pinus contorta', from=c('gbif','bison'))
out@data
occ_todf(out)

### Interactive maps

#### rCharts

# install_github("rCharts", "ramnathv", ref="dev")
library(rCharts)
spp <- c('Danaus plexippus','Accipiter striatus','Pinus contorta')
dat <- lapply(spp, function(x) occ(query=x, from='gbif'))
dat <- occmany_todf(dat)@data 
tmp <- maprcharts(data=dat)
tmp$show(cdn=TRUE)

#### To share on Github

spp <- c('Danaus plexippus','Accipiter striatus','Pinus contorta')
dat <- lapply(spp, function(x) occ(query=x, from='gbif', gbifopts=list(georeferenced=TRUE)))
dat <- occmany_todf(dat)@data
mapgist(data=dat, symbol=c("park","zoo","garden"))