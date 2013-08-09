---
title       : R-based tools for open and collaborative science
author      : Scott Chamberlain (@recology_)
job         : 
logo        : "ropensci_small.png"
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : solarized_light      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
assets      :
  css: "assets/FontAwesome/css/font-awesome.css"
---

## Science needs to be more open

<center>![need tools](assets/img/moreopen.png)</center>

[http://everyoneknowsbest.files.wordpress.com/2008/08/bodysculpture.jpg](http://everyoneknowsbest.files.wordpress.com/2008/08/bodysculpture.jpg)

---

<!-- But we need tools to do it! -->

<center>![need tools](assets/img/tools.png)</center>

[http://www.fotopedia.com/items/flickr-4796633039](http://www.fotopedia.com/items/flickr-4796633039)

---

## What kinds of tools? Not these

<center>![r](assets/img/closedtools.png)</center>

---

## These!

<center>![](assets/img/opentools.png)</center>

---

## What does an ecologist do?

+ Collect data
+ Manipulate data
+ Visualize
+ Analyze
+ Write

---

## Data increasingly on the web

<center>![](assets/img/data.png)</center>

---

## R may be the perfect solution (for ecologists)

<center>![](assets/img/r.png)</center>

---

## Why?

+ R is Open source = Free + Rapid change
+ R = entire workflow in 1 place
+ R = reproducible science

---

## The toolbet

<center>![](assets/img/ropensci_pkgs.png)</center>

[http://ropensci.org/](http://ropensci.org/)

---

## Data

<center>![](assets/img/ropensci_data.png)</center>

---

## Literature

<center>![](assets/img/ropensci_lit.png)</center>

---

#### Make an API call
```r
library(RCurl); library(RJSONIO)
dat <- fromJSON(getURL("https://api.github.com/users/hadley/repos"))
```

#### Manipulate the data
```r
library(plyr); library(reshape2)
dat_melt <- melt(ldply(dat, function(x) data.frame(x[names(x) %in% c("name","watchers_count","forks")])))
```

#### Run some statistical model
```r
lm(value ~ variable, data = dat_melt)
```

#### Visualize results
```r
library(ggplot2)
ggplot(dat_melt, aes(name, value, colour = variable)) + geom_point() + coord_flip()
```

#### Write the paper
```r
# Introduction...
```

---

## Taxonomy


```r
library(taxize)
specieslist <- "Abies procera"
classification(specieslist, db = "itis")
```

```
$`Abies procera`
        rankName       taxonName    tsn
1        Kingdom         Plantae 202422
2     Subkingdom  Viridaeplantae 846492
3   Infrakingdom    Streptophyta 846494
4       Division    Tracheophyta 846496
5    Subdivision Spermatophytina 846504
6  Infradivision    Gymnospermae 846506
7          Class       Pinopsida 500009
8          Order         Pinales 500028
9         Family        Pinaceae  18030
10         Genus           Abies  18031
11       Species   Abies procera 181835
```


---


```r
library(rgbif)
splist <- c("Accipiter erythronemius", "Junco hyemalis", "Aix sponsa", "Podiceps cristatus")
out <- occurrencelist_many(splist, coordinatestatus = TRUE, maxresults = 40)
gbifmap_list(out)
```

![plot of chunk gbif](assets/fig/gbif.png) 


---


```r
library(rbison)
out <- bison(species = "Helianthus annuus", type = "scientific_name", count = 500)
bisonmap(input = out, tomap = "county")
```

![plot of chunk bison](assets/fig/bison.png) 


---


```r
print("foo bar")
```

```
## [1] "foo bar"
```


---

## Take action!


<i class="icon-unlock icon-4x"></i> &nbsp;&nbsp;&nbsp;&nbsp; <i class="icon-wrench icon-4x"></i> &nbsp;&nbsp;&nbsp;&nbsp; <i class="icon-question icon-4x"></i>

---

## The deets

+ Presentation made using [slidify][slidify]
+ Written in markdown
+ See it online here: <give link>

[slidify]: https://github.com/ramnathv/slidify


<!-- ![current](assets/img/current.png)
[http://www.fotopedia.com/items/flickr-2621358221](http://www.fotopedia.com/items/flickr-2621358221) -->
