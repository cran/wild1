\name{Polygons.to.ppp}
\alias{Polygons.to.ppp}
\title{
Construct planar point patterns from polygons
}
\description{
Constructs a planar point pattern or list of planar segment patterns ("\code{psp}"\{\pkg{spatstat}\}) from an object of class "\code{Polygons}"\{\pkg{sp}\}
}
\usage{
Polygons.to.ppp(Poly,window=NULL,sample=FALSE,interval=NULL,...)
}

\arguments{
  \item{Poly}{
        An object of class "\code{Polygons}"
}
  \item{window}{
        An observation window (see \code{\link{owin}}.  Computed from the data if not specified.  
}
  \item{sample}{
        Logical. If \code{TRUE}, sample polygon boundary at regular intervals.  If \code{FALSE} (the default), returns vertices of polygons.
}
  \item{interval}{
        A numeric value. If \code{sample} is \code{TRUE}, specifies the interval between points sampled from the polygon boundary.  The default is 1 unit, e.g., 1 meter for a UTM grid.
}
  \item{\dots}{
        Optional arguments to \code{\link{owin}}
}
}
\details{
Facilitates application of tools in \pkg{\link{spatstat}}.
}
\value{
Returns a planar point pattern or list of planar point patterns (one component for each "\code{Polygon}" component of \code{Poly}.
}
\references{
Baddeley, A., and R. Turner. 2005. Spatstat: an R package for analyzing spatial point patterns. Journal of Statistical Software 12(6), 1-42. ISSN: 1548-7660. URL: www.jstatsoft.org
}
\author{
Glen A. Sargeant\cr
U.S. Geological Survey\cr
Northern Prairie Wildlife Research Center\cr
\email{glen_sargeant@usgs.gov}
}
\note{

}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{owin}}, \code{\link{psp}}
}
\examples{
data(wica.bdy)
str(wica.bdy)
str(wica.bdy@polygons[[1]])
wica.psp <- Polygons.to.ppp(wica.bdy@polygons[[1]],sample=TRUE,interval=200)
wica.psp
plot(wica.psp)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ manip }

