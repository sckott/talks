RSCRIPT = Rscript --no-init-file

all: html

html: 
		${RSCRIPT} -e 'rmarkdown::render("index.Rmd")'

htmlposter: 
		${RSCRIPT} -e 'rmarkdown::render("index_poster.Rmd")'

imgposter: 
		${RSCRIPT} -e 'postr::render("index_poster.html", poster_width = 109, aspect_ratio=0.666, dpi = 600)'

# No real targets!
.PHONY: all html

