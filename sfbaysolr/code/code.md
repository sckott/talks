
```r
library(rplos)
```

```
## 
## 
##  New to rplos? Tutorial at http://ropensci.org/tutorials/rplos_tutorial.html. Use suppressPackageStartupMessages() to suppress these startup messages in the future
## 
## 
## Attaching package: 'rplos'
## 
## The following object is masked from 'package:taxize':
## 
##     getkey
```

```r
plot_throughtime(list("reproducible science"), 500)
```

![plot of chunk unnamed-chunk-1](figure/unnamed-chunk-1.png) 



```r
library(rgbif)
key <- name_backbone(name = "Danaus plexippus", kingdom = "animals")$speciesKey
out <- occ_search(taxonKey = key, limit = 300, return = "data")
gbifmap(out)
```

<img src="figure/rgbif.png" title="plot of chunk rgbif" alt="plot of chunk rgbif" width="700px" height="500px" style="display: block; margin: auto;" />



```r
library(rWBclimate)
country_dat <- get_historical_temp(c("USA", "MEX", "CAN", "BLZ"), "year")
ggplot(country_dat, aes(x = year, y = data, group = locator)) + 
  theme_bw(base_size=18) + geom_point() + geom_path() + labs(y="Average annual temperature of Canada", x="Year") + 
  stat_smooth(se = F, colour = "black") + facet_wrap(~locator, scale = "free")
```

<img src="figure/rWBclimate.png" title="plot of chunk rWBclimate" alt="plot of chunk rWBclimate" width="700px" height="400px" style="display: block; margin: auto;" />



```r
library(spocc)
library(rCharts)
spnames <- c("Accipiter striatus", "Setophaga caerulescens", "Spinus tristis")
out <- occ(query = spnames, from = c("gbif", "bison"), gbifopts = list(georeferenced = TRUE))
head(out$gbif$`Accipiter striatus`$data)
```

```
##                                name       key longitude latitude prov
## 1 Accipiter striatus Vieillot, 1808 773408845    -97.28   32.876 gbif
## 2 Accipiter striatus Vieillot, 1808 768992325    -76.10    4.724 gbif
## 3 Accipiter striatus Vieillot, 1808 773414146   -122.27   37.771 gbif
## 4 Accipiter striatus Vieillot, 1808 773440541    -98.00   32.800 gbif
## 5 Accipiter striatus Vieillot, 1808 773423188    -76.54   38.688 gbif
## 6 Accipiter striatus Vieillot, 1808 773432602   -122.78   38.613 gbif
```

```r
dat <- ldply(out$gbif, "[[", "data")
maprcharts(dat)
```

```
## <iframe src=figure/spocc.html seamless></iframe>
```


