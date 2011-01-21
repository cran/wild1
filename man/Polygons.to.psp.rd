\name{Polygons.to.psp}
\alias{Polygons.to.psp}
\title{
Construct planar segment patterns from polygons
}
\description{
Constructs a planar segment pattern or list of planar segment patterns ("\code{psp}"\{\pkg{spatstat}\}) from an object of class "\code{Polygons}"\{\pkg{sp}\}
}
\usage{
Polygons.to.psp(Poly,window=NULL,...)
}

\arguments{
  \item{Poly}{
        An object of class "\code{Polygons}"
}
  \item{window}{
        An observation window (see \code{\link{owin}}.  Computed from the data if not specified.  
}
  \item{\dots}{
        Optional arguments to \code{\link{owin}}
}
}
\details{
Facilitates application of tools in \pkg{\link{spatstat}}.
}
\value{
Returns a planar segment pattern or list of planar segment patterns (one component for each "\code{Polygon}" component of \code{Poly}.
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
wica.psp <- Polygons.to.psp(wica.bdy@polygons[[1]])
wica.psp
plot(wica.psp)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ manip }

