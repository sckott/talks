all:
	Rscript -e 'rmarkdown::render("index.Rmd")'

pdf:
	Rscript -e 'webshot::webshot("index.html", "index.pdf")'
