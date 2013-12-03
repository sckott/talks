How to reproduce this presentation
=====

### Abstract for this talk

The products and raw materials of science, including papers, data, and code, are increasingly moving on to the web and coming out from behind paywalls. This means scientists have easy access to these products, at least those that are freely available. While the growing amount of scientific resources on the web holds great potential for advancing research, the absence of tools is preventing scientists from taking full advantage. A common science workflow includes many different tools, or software applications (e.g., browser + Excel + SigmaPlot + SAS); this worfklow increases the possibility for mistakes and is difficult to reproduce.rOpenSci – a collaborative effort to build open source tools to facilitate open science – is building bridges between data resources on the web and the open source R software, a programming environment already familiar to many biologists. The tools we are building provide ways to do data acquisition and data sharing in the open source R environment, where you can manipulate, analyze, and visualize the data, creating a worfklow inside a single software application. This facilitates replicable workflows, makes collaboration easier, and can spur open science. 

------------

You can either download this repo as a zip and then navigate to this folder, or if you know git, you can clone this repo down to your machine. 

Once you have the files, in R:

### Install dependencies

```coffee
install.packages("devtools")
library(devtools)
install_github("slidify", "ramnathv", ref="dev")
install_github("slidifyLibraries", "ramnathv", ref="dev")
```

### You can edit the presentation then compile to html

```coffee
library(slidify)
slidify("index.Rmd")
```

Then open the index.html file in your browser. 

And done! 