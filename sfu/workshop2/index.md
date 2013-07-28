---
title       : Communities, networks, & visualizations in R
date        : 2013-07-31
author      : Scott Chamberlain
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
assets      :
  css: "http://netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css"
---

## The plan

+ General visualizations
+ Community ecology: analyses and viz
+ Networks/graphs: analyses and viz

---

## Lets have some fun first - visualizations


```r
install.packages("ggplot2")
```



```r
library(ggplot2)
ggplot(data=iris, aes(Sepal.Length, Sepal.Width, colour=Species)) +
  geom_point() + 
  scale_color_manual(values = c("#FF0000", "#0000FF", "#00FF00"))
```

<img src="assets/fig/viz2.png" title="plot of chunk viz2" alt="plot of chunk viz2" style="display: block; margin: auto;" />


---

## Terminology

+ ggplot - The main function where you specify the dataset and variables to plot
+ geom - geometric objects
  + `geom_point()`, `geom_bar()`, `geom_density()`, `geom_line()`, `geom_area()`
+ aes - aesthetics
  + shape, alpha (transparency), color, fill, linetype
+ scale - Define how your data will be plotted
  + continuous, discrete, log

---

## Building blocks, mix and match


```r
ggplot(data=iris, aes(Sepal.Length, Sepal.Width, colour=Species)) +
  geom_point()
```


OR, just do 


```r
p <- ggplot(data=iris, aes(Sepal.Length, Sepal.Width, colour=Species))
p + geom_point()
```


---

## Color by species


```r
ggplot(data=iris, aes(Sepal.Length, Sepal.Width, colour=Species)) +
  geom_point()
```

<img src="assets/fig/color1.png" title="plot of chunk color1" alt="plot of chunk color1" style="display: block; margin: auto;" />


---

## Adjust the size (and color) of points


```r
ggplot(data=iris, aes(Sepal.Length, Sepal.Width, colour=Species)) +
  geom_point(size = 6)
```

<img src="assets/fig/size1.png" title="plot of chunk size1" alt="plot of chunk size1" style="display: block; margin: auto;" />


even cooler


```r
ggplot(data=iris, aes(Sepal.Length, Sepal.Width, color=Species, size=Species)) +
  geom_point()
```

<img src="assets/fig/size2.png" title="plot of chunk size2" alt="plot of chunk size2" style="display: block; margin: auto;" />


---

## Facet by species


```r
ggplot(data=iris, aes(Sepal.Length, Sepal.Width)) +
  geom_point() +
  facet_wrap(~ Species)
```

<img src="assets/fig/viz4.png" title="plot of chunk viz4" alt="plot of chunk viz4" style="display: block; margin: auto;" />


--- &twocol

## Combine geoms

*** =left

### Combine `geom_boxplot` and `geom_point`


```r
ggplot(data=iris, aes(Species, Petal.Width)) +
  geom_boxplot() +
  geom_point()
```

<img src="assets/fig/combinegeoms1.png" title="plot of chunk combinegeoms1" alt="plot of chunk combinegeoms1" style="display: block; margin: auto;" />


*** =right

### Order matters! 


```r
ggplot(data=iris, aes(Species, Petal.Width)) +
  geom_point() +
  geom_boxplot()
```

<img src="assets/fig/combinegeoms2.png" title="plot of chunk combinegeoms2" alt="plot of chunk combinegeoms2" style="display: block; margin: auto;" />


---

## Make this plot




--- 

## Saving plots using ggplot2

If the plot is on your screen

```r
ggsave("~/path/to/figure/filename.png")
```


If your plot is assigned to an object

```r
ggsave(plot1, file = "~/path/to/figure/filename.png")
```


Specify a size

```r
ggsave(file = "/path/to/figure/filename.png", width = 6, height = 4)
```


Or any format (pdf, png, eps, svg, jpg)

```r
ggsave(file = "/path/to/figure/filename.eps")
ggsave(file = "/path/to/figure/filename.jpg")
ggsave(file = "/path/to/figure/filename.pdf")
```


<!-- community structure -->
<!-- community structure -->
<!-- community structure -->

--- 

## Community structure

+ ad
+ ad
+ ad

---


<!-- networks -->

--- 

## Networks

+ ad
+ ad
+ ad

---
