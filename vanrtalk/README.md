How to reproduce this presentation
=====

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