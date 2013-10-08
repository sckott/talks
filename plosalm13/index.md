---
title       : Programmatic access for Altmetrics
date        : 2013-10-10
author      : Scott Chamberlain (@recology_)
job         : rOpenSci
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : solarized_light      # 
widgets     : [nvd3]            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
assets      :
  css: "http://netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css"
---

<!-- 
SHOOTING FOR 15 MIN (15-20 IS GOOD, BUT DO NO MORE THAN 15 MIN.) 
-->
<br><br><br><br>
<center><img src="assets/img/ropensci_main.png"></center>

---

<br><br><br><br>
<center>
### Find this talk here [http://bit.ly/roalm](http://bit.ly/roalm)

### Made with [Slidify](http://slidify.org/); the code [here](https://github.com/SChamberlain/posterstalks/blob/gh-pages/plosalm13/index.Rmd)

### Press "o" to bring up all slides - <i class="icon-arrow-left"> &nbsp; </i><i class="icon-arrow-right"></i> to navigate
</center>

---

<br><br><br>

<font size="14"><center> Programmatic access to altmetrics <br><br>
Open altmetrics data</center></font>

---

## Programmatic access

<center>![](assets/img/code.png)</center>

<!-- used by the provider themselves, publishers, in a web browse, and from the command line -->

---

## Programmatic access to altmetrics

Computers are simply better at repetitive tasks

* Makes repetitive tasks take far less time
* Facilitates tool creation by developers
* Allows research questions to be addressed more quickly
* Facilitates reproducibility

--- 

<br><br><br>
<font size="14"><center>What is needed for easy programmatic access?</center></font>

--- 

## Modern API technology

[REST API](http://en.wikipedia.org/wiki/REST_API) - the modern way to serve data to consumers

* Base URI, e.g. http://foo.com
* Media type, e.g., json, xml
* HTTP verbs, like GET, POST, PUT, PATCH, HEAD, etc...

Makes data consumption easy from any programming language

---

## Proper HTTP status codes

* 1xx - informational
* 2xx - success
* 3xx - redirection
* 4xx - client error
* 5xx - server error

--- 

## Good docs (for developers)

<br>
<center>![](assets/img/book.png)</center>

--- 

## Authentication
<br>
OAuth makes sense for web workflows, but not so much for programmatic workflows.

Having both options is nice.

---

<br><br><br>
<font size="14"><center>Consuming altmetrics programmatically</center></font>

---

## We need altmetrics research

<center>![](assets/img/beaker.png)</center>

<!-- 
if we are to avoid mistakes of JIF, we need research on altmetrics
-->

---

## Programmatic access to altmetrics data key for reproducibility
<center>![](assets/img/spinner.png)</center>

---

## What languages do researchers use?

* R
* Python
* Ruby?

---

## Many libraries available, but more needed

| Data source   | Libraries            |
| ------------- | -------------        |
| PLOS ALM      | R                    |
| ImpactStory   | R, Javascript        |
| Altmetric     | R, Python, Ruby, iOS |
| PlumAnalytics | ??                   |

<!-- table of libraries available for different APIs -->

---

## rOpenSci contributions in R
<br><br>
+ [alm](http://cran.r-project.org/web/packages/alm/index.html) for PLOS ALM (& other publishers?)
+ [rImpactStory](http://cran.r-project.org/web/packages/rImpactStory/index.html) for ImpactStory
+ [rAltmetric](http://cran.r-project.org/web/packages/rAltmetric/index.html) for Altmetric
+ metaAltmetrics - (*not made*) Combine altmetrics across providers, across canonical data sources

---

## Interacting with REST APIs in R


```r
out <- GET("http://alm.plos.org/api/v3/articles?doi=10.1371/journal.pmed.1001361&key=<key>")
stop_for_status(out)
content(out)
```

```r
{
  doi: "10.1371/journal.pmed.1001361",
  title: "Personalized Prediction of Lifetime Benefits with Statin Therapy for Asymptomatic Individuals: A Modeling Study",
  url: "http://www.plosmedicine.org/article/info%3Adoi%2F10.1371%2Fjournal.pmed.1001361",
  mendeley: "437b07d9-bc40-4c57-b60e-1f60fefe2300",
  pmid: "23300388",
  pmcid: "3531501",
  publication_date: "2012-12-27T08:00:00Z",
  update_date: "2013-10-07T11:06:58Z",
  views: 9329,
  shares: 62,
  bookmarks: 5,
  citations: 1
}
```

---

## Almetrics data via R


```r
alm(doi = "10.1371/journal.pone.0029797")
```


```coffee
An object of class "almtot"
Slot "meta":
$doi
[1] "10.1371/journal.pone.0029797"
...<more metadata>

Slot "summary":
  views shares bookmarks citations
1 29229    237        51         7

Slot "data":
                .id  pdf  html shares groups comments likes citations total
1         bloglines   NA    NA     NA     NA       NA    NA         0     0
2         citeulike   NA    NA      1     NA       NA    NA        NA     1
3          connotea   NA    NA     NA     NA       NA    NA         0     0
4          crossref   NA    NA     NA     NA       NA    NA         7     7
5            nature   NA    NA     NA     NA       NA    NA         4     4
...
```

---

## Metadata


```r
almmeta("mendeley")
```

```
$mendeley
$mendeley$desc
[1] "Mendeley is a reference manager and social bookmarking tool. The Mendeley API returns incomplete API responses for articles where they don't have enough information, and we ignore those."

$mendeley$infourl
[1] "https://github.com/articlemetrics/alm/wiki/Mendeley"

$mendeley$authentication
[1] "OAuth 1.0"

$mendeley$apiurl
[1] "http://api.mendeley.com/oapi/documents/details/DOI/?type=doi&consumer_key=API_KEY"
```


---

<style type="text/css">
  table {
    border: none;
    width: 100%;
    border-collapse: collapse;
    font-size: 24px;
    line-height: 12px;
    font-family: 'Trebuchet MS';
    font-weight: bolder;
    color: rgb(102, 102, 102);
  }

  table td, table th {
    font-size: 20px;
    padding: 1em 0.5em;
  } 
</style>

## Combining metrics across aggregators

| Data source | PLoS | ImpactStory | Altmetric |
| ----------- | ---- | ----------- | --------- |
| WebOfScience | webofscience | -- | -- |
| Dryad | -- | dryad:total_downloads package_views | -- |
| Figshare | -- | figshare:views shares downloads | -- | 
| Github | -- | github:forks stars | -- |
| Google+ | -- | -- | cited by gplus count |
| MSM | -- | -- | cited by msm count |
| Scopus citations | scopus | plosalm:scopus | -- |
| Mendeley readers | mendeley shares | mendeley readers | mendeley readers |
| Twitter | twitter | topsy:tweets | cited by tweeters count |

---

## Combining metrics

### Get data from three different providers

```coffee
plos_data <- alm(doi)
impactstory_data <- metrics(doi)
altmetric_data <- altmetric_data(altmetrics(doi))
```


### Easily combine data with a single function, and highlight inconsistencies





```r
alt_combine(plos_data, impactstory_data, altmetric_data)
```

```
Warning: Inconsistency in facebookLikes, check metadata
```

```
       dataSource fromProvider values
1         twitter      PLOSALM    100
2   facebookLikes  ImpactStory     50
3   facebookLikes    Altmetric     40
4 scopusCitations    Altmetric    150
```


--- 

## Example in R

Load libraries, get 200 DOIs, get ALM data, plot


```r
library(rplos); library(alm); library(plyr)
dois <- searchplos(terms='*:*', fields="id", limit=200)
alm <- ldply( alm(doi=do.call(c,dois$id), total_details=TRUE) )
plot_density(alm, c("counter_pdf","mendeley_shares","pmc_pdf","pmc_total"), c("#83DFB4","#EFA5A5","#CFD470","#B2C9E4"), plot_type="h")
```

<img src="assets/fig/plot.png" title="plot of chunk plot" alt="plot of chunk plot" style="display: block; margin: auto;" />


---


```r
library(rplos); library(alm); library(rCharts)
dois <- c('10.1371/journal.pone.0001543','10.1371/journal.pone.0040117','10.1371/journal.pone.0029797','10.1371/journal.pone.0039395')
dat <- signposts(doi=dois)
```



```r
plot_signposts(input = dat, type = "multiBarChart", height = 400)
```


<div id='chart41595442e577' class='rChart nvd3'></div>
<script type='text/javascript'>
 $(document).ready(function(){
      drawchart41595442e577()
    });
    function drawchart41595442e577(){  
      var opts = {
 "dom": "chart41595442e577",
"width":    800,
"height":    400,
"x": "doi",
"y": "value",
"group": "variable",
"type": "multiBarChart",
"id": "chart41595442e577" 
},
        data = [
 {
 "doi": "0040117",
"variable": "views",
"value":   1628 
},
{
 "doi": "0039395",
"variable": "views",
"value":   1035 
},
{
 "doi": "0029797",
"variable": "views",
"value":  29208 
},
{
 "doi": "0001543",
"variable": "views",
"value":   3494 
},
{
 "doi": "0040117",
"variable": "shares",
"value":      0 
},
{
 "doi": "0039395",
"variable": "shares",
"value":      0 
},
{
 "doi": "0029797",
"variable": "shares",
"value":    237 
},
{
 "doi": "0001543",
"variable": "shares",
"value":      0 
},
{
 "doi": "0040117",
"variable": "bookmarks",
"value":      8 
},
{
 "doi": "0039395",
"variable": "bookmarks",
"value":      8 
},
{
 "doi": "0029797",
"variable": "bookmarks",
"value":     51 
},
{
 "doi": "0001543",
"variable": "bookmarks",
"value":      8 
},
{
 "doi": "0040117",
"variable": "citations",
"value":      1 
},
{
 "doi": "0039395",
"variable": "citations",
"value":      0 
},
{
 "doi": "0029797",
"variable": "citations",
"value":      7 
},
{
 "doi": "0001543",
"variable": "citations",
"value":      5 
} 
]
  
      var data = d3.nest()
        .key(function(d){
          return opts.group === undefined ? 'main' : d[opts.group]
        })
        .entries(data)
      
      nv.addGraph(function() {
        var chart = nv.models[opts.type]()
          .x(function(d) { return d[opts.x] })
          .y(function(d) { return d[opts.y] })
          .width(opts.width)
          .height(opts.height)
         
        chart
  .reduceXTicks(false)
          
        

        
        
        
      
       d3.select("#" + opts.id)
        .append('svg')
        .datum(data)
        .transition().duration(500)
        .call(chart);

       nv.utils.windowResize(chart.update);
       return chart;
      });
    };
</script>


---

## Altmetric API from Python

get [here](https://pypi.python.org/pypi/altmetric)


```r
from altmetric import Altmetric
a = Altmetric()
out = a.doi('10.1126/science.1173146')
out['history']
```


```bash
# Almetric score history
{u'1d': 0,
 u'1m': 0,
 u'1w': 0,
 u'1y': 5.328,
 u'2d': 0,
 u'3d': 0,
 u'3m': 0,
 u'4d': 0,
 u'5d': 0,
 u'6d': 0,
 u'6m': 0,
 u'at': 18.688}
```

---

<center>![](assets/img/unlock.png)</center>

---

## Why is openness a good thing?

Altmetrics needs checks on

* Consistency (tweets from source A and B should be =)
* Correlation (is metric A strongly corr. with B?)
* Interpretation (open source the interpretation)
* Gaming (security through obscurity doesn't work)

<!-- 
This can be done better when data is open and easily available.
-->

---

## Additional value from openness

* Knowledge from research findings
  * Doesn't require open data I suppose :(, but helps
* Open products
  * [ReaderMeter](http://readermeter.org/)
  * [ScienceCard](http://sciencecard.org/)
* For-profit products

---

## An open use case

*Are individual altmetrics consistent among data providers?*

<img src="assets/fig/isqfig2.png" title="plot of chunk isqfig2" alt="plot of chunk isqfig2" style="display: block; margin: auto;" />


---

## Lack of JIF transparency - major DORA complaint

Altmetrics APIs could provide

* Provenance for each metric
* Any data manipulation done
* Date of data collection
* more...

---

## Additional reasons for openness

When hefty decisions are made on the back of altmetrics, open avail. of data will pay off

* Track provenance of a metric
* What calculations were made

Openness may engender trust in the community

---

<br><br><br>
<font size="14"><center>Do we need a CommonCrawl for altmetrics?</center></font>

<!-- 
Wouldn't necessarily detract value form what commercial companies do -
In fact, may create greater value.
-->

---

<br><br><br>

<font size="14"><center> Programmatic access <br><br>
Open altmetrics data</center></font>
