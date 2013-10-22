---
title       : Altmetrics - Article-level impact for web native scholarship
date        : 2013-10-25
author      : Scott Chamberlain
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : solarized_light      # 
widgets     : [nvd3]            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
assets      :
  css: "http://netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css"
---

<!-- 
Have a 30 min slot, SHOOTING FOR 25 minutes
-->

<br><br><br><br>
<center>
### Find this talk here [http://bit.ly/sfualm](http://bit.ly/sfualm)

### Made with [Slidify](http://slidify.org/); the code [here](https://github.com/SChamberlain/posterstalks/blob/gh-pages/sfuoa/index.Rmd)

### Press "o" to bring up all slides - <i class="icon-arrow-left"> &nbsp; </i><i class="icon-arrow-right"></i> to navigate

### Press "w" to change aspect ratios
</center>

---

## The plan

+ Pose the problem: jif doesn't capture article level impact.  Jif not open., easily gamed, single entity controlling
+ the solution: altmetrics, open versions, transparent, diverse impacts, 
+ relation to open access: see ross' paper, can give OA journals some visibility in absence of impact factor
+ really not being used for hiring decisions now, but possibly soon? It seems inevitable
+ details: what do they look like? How are they collected.  
+ wrap up

---

## There are a lot of papers out there
<br>
<center>![](assets/img/papers.png)</center>

<font size="6"><a href="http://bit.ly/18pwYPa">Cali.org, Eric Molinsky</a></font>

---

<br><br><br>

<font size="14"><center> How do we sort them out, the good from the bad </center></font>

---

## We rank journals using the JIF
<br>
<center>![](assets/img/jif.png)</center>

---

## Then we judge papers, journals, scholars, departments, schools on journal IF's
<br>
<center>![](assets/img/jif_judge.png)</center>

---

<br><br><br>

<font size="14"><center> Problems </center></font>

--- 

## JIF is not open
<center>![](assets/img/lock.png)</center>

--- 

## JIF is controlled by single for-profit entity w/o transparency
<br>
<center>![](assets/img/jif.png)</center>

--- 

## Measured at the journal level
<br>
<center>![](assets/img/journallevel_1.jpg)</center>

---

## Articles within journals vary in impact
<br>

<center><em><font size="10">"15% of a journal's articles get 50% of the citations"</font></em></center>
<br><br><br><br><br><br>
<font size="4">
[1]: Seglen, P. O. (1992), The skewness of science. J. Am. Soc. Inf. Sci., 43: 628–638. 
</font>

---

## Frustration with the JIF

<br>
<center>![](assets/img/dora.png)</center>

<center><h2>9,596 signatories</h2></center>

---

<br><br><br>

## Altmetrics

## Article-level metrics

## Alternative metrics

---

## Measured on article level

<center>![](assets/img/singlearticle.png)</center>

---

## Measured at <span class="strikeout">article</span> *object* level

<div class="row" align="center">
	<img src="assets/img/articlesmall.png"></img>
	&nbsp;&nbsp;
	<img src="assets/img/dataset.png"></img>
	&nbsp;&nbsp;
	<img src="assets/img/figure.png"></img>
</div>
<div class="row" align="center">
	<img src="assets/img/code.png"></img>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<img src="assets/img/check.png"></img>
</div>

---

## ImpactStory just got NSF grant to track software reuse/impact

*screenshot of their proposal on Figshare*

---

## <font color="black">Altmetrics measure diverse impacts</font>
<br>
* <font color="blue">Usage</font>: html, xml, pdf downloads
<br><br><br>
* <font color="orange">Citations</font>: Scopus, PubMed Central, Crossref
<br><br><br>
* <font color="green">Social media</font>: Twitter, Mendeley, Facebook, etc.

---

## Diverse set of providers
<br>

<div class="row">
  <img src="assets/img/plumanalytics.png"></img>
  &nbsp;&nbsp;&nbsp;&nbsp;
  <img src="assets/img/altmetricdotcom.png"></img>
  &nbsp;&nbsp;
  <img src="assets/img/impactstory.png"></img>
  &nbsp;&nbsp;&nbsp;&nbsp;
  <img src="assets/img/plosalm.png"></img>
</div>

---

## Which...

* Serve 
	* Universities: Plum Analytics
	* Publishers: Altmetric.com, ImpactStory
	* Individuals: ImpactStory
	* Readers: PLOS ALM
* Vary in openness 
	* Open data: PLOS\*\*, Plum Analytics\*\*
	* Some open data: Altmetric.com
	* Open data, but API deprecated: ImpactStory

---

<br><br><br>

<font size="14"><center> What does this have to do with OA? </center></font>

<!-- relation to open access: see ross' paper, can give OA journals some visibility in absence of impact factor -->

--- 

## Many OA journals don't select for impact

Altmetrics can help filter articles *after* publication

*screenshot of two different papers w/ very different altmetrics data*

---

## Filtering is a key thing altmetrics can do

* But largely unrealized
* Though some promising work from researchers

<screenshot from jevin west's work>

* And at least one app: NAME?

---

<br><br><br>

<font size="14"><center> What do these altmetrics look like? And where do they come from? </center></font>

<!-- details: what do they look like? How are they collected. -->

---

## Usage

* html, xml, pdf downloads, collected by publishers





```r
# Plot data from html, xml, and pdf across papers, all within same plot if
# possible
```


---

## Citation

* Scopus, PubMed Central, Crossref


```r
# Plot data from html, xml, and pdf across papers, all within same plot if
# possible
```


---

## Social media

* Twitter, Mendeley, Facebook, etc., collected by altmetrics aggregators


```r
# Plot data from html, xml, and pdf across papers, all within same plot if
# possible
```


--- 

<br><br><br>

<font size="14"><center> How are altmetrics being used? </center></font>

<!-- really not being used for hiring decisions now, but possibly soon? It seems inevitable. being
used for filtering what papers to read
used for ????
-->

---

## Plum Analytics 

* Institutional subscribers w/ altmetrics dashboards for their faculty/staff
* Don't know if they evaluate them on these though?

<center><img src="assets/img/plum_dashboard.png"></center>

---

## ImpactStory

* Pushing their profiles as the new CV

<center><img src="assets/img/impactstory_profile.png"></center>

---

## Altmetric.com

* Publishers using to display metrics

<center><img src="assets/img/altmetric_eg.png"></center>

---

* Anecdotes that academics reporting altmetrics on their CV's and say that it *may* have helped them get tenure

---

<br><br><br>

<font size="14"><center> Programmatic access to altmetrics </center></font>
<br><br><br>
<center><img src="assets/img/ropensci_main.png"></center>

--- 

## Data via alm interface to PLOS ALM


```r
library(alm)
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

<br><br><br>

<font size="14"><center> Wrapping up </center></font>

--- 

<br><br><br>

<font size="14"><center> We don't want altmetrics to become the new JIF </center></font>

--- 

## Things to worry about

* Data consistency: aggregators don't collect data in the same way, e.g., Twitter => ImpactStory (Topsy), Altmetric (Twitter API), PlumAnalytics (Topsy), PLOS ALM (??)
* Data provenance: aggregators tracking this, but newcomers may not - some provenance we'll never know
* Long-term sustainability: Web resources are ephemeral - how do we ensure data persistence?
* Openness: 
	* open data
	* transparent calculations

---

<div class="row">
	<img src="assets/img/comments.png">
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<img src="assets/img/unlock.png">
</div>
