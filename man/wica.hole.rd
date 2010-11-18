\name{hole.gpc}
\alias{hole.gpc}
\docType{data}
\title{
Polygonal "hole" in Wind Cave National Park
}
\description{
A sample object of class \code{gpc.poly}\{\pkg{gpclib}\} describing a region (of no significance) within Wind Cave National Park.
}
\usage{data(hole.gpc)}
\format{
  The format is:
Formal class 'gpc.poly' [package "gpclib"] with 1 slots
\cr  ..@ pts:List of 1
\cr  .. ..$ :List of 3
\cr  .. .. ..$ x   : num [1:10] 621309 622089 623798 624608 625207 ...
\cr  .. .. ..$ y   : num [1:10] 4828695 4829655 4829715 4829085 4827316 ...
\cr  .. .. ..$ hole: logi TRUE
}
\source{
Derived from an ESRI shapefile provided by Kevin Kovacs, NPS Wind Cave National Park.
}
\references{
Roger D. Peng with contributions from Duncan Murdoch and Barry Rowlingson; GPC library by Alan Murta (2010). gpclib: General Polygon Clipping Library for R. R package version 1.5-1. \code{http://CRAN.R-project.org/package=gpclib}
}
\examples{
data(wica.bdy)
data(hole.gpc)
plot(wica.bdy,col="gray")
plot(hole.gpc,add=TRUE)
}
\keyword{datasets}
