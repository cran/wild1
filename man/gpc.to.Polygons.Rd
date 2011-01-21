\name{gpc.to.Polygons}
\alias{gpc.to.Polygons}
\alias{Polygons.to.gpc}
\title{
Construct "gpc.poly" from "Polygons"
}
\description{
Package \pkg{wild1} uses objects of class "\code{Polygons}"\{\pkg{sp}\} to represent home ranges of animals.  Functions \code{gpc.to.Poly} and \code{Poly.to.gpc} facilitate conversion to/from classes "\code{gpc.poly}"\{\pkg{gpclib}\} and "\code{Polygons}."  Package \pkg{gpclib} can be used to find unions, intersections, and differences for objects of class "\code{gpc.poly}." 
}
\usage{
gpc.to.Polygons(x, ID = NA)
Polygons.to.gpc(x)
}

\arguments{
  \item{x}{
        An object of class "\code{gpc.poly}" or "\code{Polygons}"
}
  \item{ID}{
        A character vector of length one; see \code{\link{Polygons}} 
}
}
\details{
These functions requires \pkg{\link{sp}} and \pkg{gpclib}.  The latter is subject to license restrictions and is not free for commercial use.
}
\value{
Returns an object of class "\code{gpc.poly}" or "\code{Polygons}"
}
\references{
Bivand, R. S., E. J. Pebesma, and V. Gomez-Rubio, 2008. Applied spatial data analysis with R. Springer, NY.
  <http://www.asdar-book.org/>

Pebesma, E.J., R.S. Bivand, 2005. Classes and methods for spatial data in R. R News 5 (2).
  <http://cran.r-project.org/doc/Rnews/>

Roger D. Peng with contributions from Duncan Murdoch and Barry Rowlingson; GPC library by Alan Murta. gpclib: General Polygon Clipping Library for R. <http://CRAN.R-project.org/package=gpclib>
}
\author{
Glen A. Sargeant\cr
U.S. Geological Survey\cr
Northern Prairie Wildlife Research Center\cr
\email{glen_sargeant@usgs.gov}
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{kde}}, \pkg{\link{ks}}, \code{\link{plot.Polygons}}, \pkg{\link{sp}}
}
\examples{
require(gpclib)

data(wica.gpc)
class(wica.gpc)

data(xy.elk)
mcp.poly <- hr.mcp(xy.elk)
class(mcp.poly)

mcp.gpc <- Polygons.to.gpc(mcp.poly)
class(mcp.gpc)

mcp.inwica.gpc <- intersect(wica.gpc,mcp.gpc)
class(mcp.inwica.gpc)

mcp.inwica.poly <- gpc.to.Polygons(mcp.inwica.gpc)

data(wica.bdy)
plot(wica.bdy,col="gray")
plot(mcp.inwica.poly,fg="tan",add=TRUE,lty=2)
plot(mcp.poly,lty=2,add=TRUE)
box()

xy.inwica <- restrict.domain(x=xy.elk,domain=wica.bdy,plot=FALSE)
points(xy.inwica$inside$coords,pch=21,bg="salmon")
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
%\keyword{ }
