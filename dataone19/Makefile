all:
	Rscript -e 'rmarkdown::render("intro.Rmd")'

pdf:
	Rscript -e 'webshot::webshot("intro.html", "intro.pdf")'
