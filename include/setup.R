
## @knitr setup
#setCacheDir("cache")
require(grDevices) 
require(datasets) 
require(stats) 
require(lattice)
require(grid) 
require(mosaic) 
require(mosaicData) 
trellis.par.set(theme=col.mosaic(bw=FALSE))
trellis.par.set(fontsize=list(text=9))
options(keep.blank.line=FALSE) 
options(width=60)
# require(vcd)          # went away 11/5/2015 by njh  
require(knitr)
opts_chunk$set(  tidy=TRUE,
			     size='small',
                 dev="pdf",
                 fig.path="figures/fig-",  
                 fig.width=3, fig.height=2,
                 fig.align="center",
                 fig.show="hold",
                 comment=NA)
knit_hooks$set(chunk=function(x,options){
	vshift <- options$vshift
    if (is.null(vshift)) vshift <- "0ex"
	return(paste("%% Using custom chunk hook function", 
		  paste("\\vspace*{",vshift,"}%", sep=""),
		  "\\begin{knitrout}%",
	      "\\definecolor{shadecolor}{rgb}{0.9, 0.9, 0.9}\\color{fgcolor}%",
		  "\\begin{kframe}%",
          sub("\\n$","",x), 
         "\\end{kframe}%",
		  paste("\\vspace*{",vshift,"}%", sep=""),
		 "\\end{knitrout}",
		 sep="\n"
		 ))
})

knit_hooks$set(document = function(x) {
  gsub('\\\\end\\{knitrout\\}%\n', '\\\\end\\{knitrout\\}%', paste(x, collapse = '\n'))
  gsub('\\\\end\\{knitrout\\}\n', '\\\\end\\{knitrout\\}%', paste(x, collapse = '\n'))
})

if(FALSE){
knit_hooks$set(output=function(x,options) {
	   vshift <- options$vshift
	   if (is.null(vshift)) vshift <- "0ex"
	   return(paste("%% Using custom output hook function", 
			 paste("\\vspace*{",vshift,"}", sep=""),
			 "\\begin{verbatim}",
			  sub("\\n$","",x), 
			 "\\end{verbatim}%",
			 paste("\\vspace*{",vshift,"}", sep=""),
			  sep="\n" ))
})
}
