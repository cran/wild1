\name{wica.hole.gpc}
\alias{wica.hole.gpc}
\docType{data}
\title{
National Park Boundary and polygonal "hole"
}
\description{
An object of class \code{gpc.poly} for use in demonstrating polygon clipping. The class is provided by package \pkg{gpclib}.
}
\usage{data(wica.hole.gpc)}
\format{
  The format is:
Formal class 'gpc.poly' [package "gpclib"] with 1 slots
\cr  ..@ pts:List of 2
\cr  .. ..$ :List of 3
\cr  .. .. ..$ x   : num [1:76] 632999 633008 633042 634179 634181 ...
\cr  .. .. ..$ y   : num [1:76] 4832033 4831626 4831627 4831646 4831566 ...
\cr  .. .. ..$ hole: logi FALSE
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
data(wica.hole.gpc)
plot(wica.hole.gpc)
}
\keyword{datasets}
