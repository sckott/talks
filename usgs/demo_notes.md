# USGS demo

+ show sidebar
	+ help buttons bring down modals with information
+ all tabs have a few buttons on right hand side, for CODE, HELP, AND DOWNLOAD - all bring down modals with information and links - and you can easily copy code out of the code modals
+ name resolution
	+ if names spelled wrong, they won't show up on the right
	+ this can be improved quite a bit by adding in options for data source, partial matching, etc.
+ classification
	+ give some upstream taxonomic names
+ downstream
	+ we have functions in our taxize R pkg to get all taxa downstream from a supplied taxonomic name, both from ITIS and Catalogue of Life - can be pretty handy
+ phylogeny
	+ We search the Phylomatic API, which prunes a master phylogeny to your taxon list, and we also search out inasiveness data from the Global INvasive species database, and plot that on the phylogeny - this is just a demonstration of the kinds of things you can do in R
+ map
	+ This is a pretty cool feature of the app, gives an interactive map of occurrence data for the supplied taxon list. Based on the rCharts R package made by Ramnath, uses combination of R and javascript to make the map. You can choose GBIF or BISON data source, how many records, color palette, and map layer.
+ papers
	+ searches the PLOS search API for mentions of your taxon list
	+ The links open a paper in Macrodocs, a nice reading environment
+ that's it!
+ Future directions:
	+ Add ability to call more R functions to do various tasks
	+ Speed
	+ Analyses on phylogenies or spatial data perhaps
+ Love to take any questions now.