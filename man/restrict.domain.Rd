\name{restrict.domain}
\alias{restrict.domain}
\title{
Domain restriction
}
\description{
Limit the extent of a spatial point pattern
}
\usage{
restrict.domain(x, y = NULL, domain, plot=TRUE, add=FALSE, col.in="salmon",col.out="gray", ...)
}

\arguments{
  \item{x}{
        A vector, matrix, or data frame of coordinates
}
  \item{y}{
        A numeric vector (if \code{x} is a vector) or \code{NULL} 
}
  \item{domain}{
        An object of class "\code{matrix}," "\code{Polygon}," "\code{Polygons}," "\code{SpatialPolygonsDataFrame}," or "\code{gpc.poly}."
}
  \item{plot}{
        Logical.  Produce a diagnostic plot? Default is \code{TRUE}.
}
  \item{add}{
        Logical. Create a new plot (\code{FALSE}) or add to an existing plot on the current output device (\code{TRUE}).
}
  \item{col.in}{
        Fill color for admissible points
}
  \item{col.out}{
        Fill color for admissible points
}
  \item{\dots}{
        Optional arguments to \code{\link{plot}}.  See also \code{\link{par}}.
}
}

\details{
Sometimes point patterns include observations that are clearly inadmissible.  Consider, for example, the case of a terrestrial mammal erroneously "observed" at sea.  In such cases, investigators may wish to restrict the geographic domain and eliminate data that are clearly faulty.  In other cases, investigators may wish to exclude legitimate data and restrict an analysis to a geographic area of interest.

Point pattern data can be partitioned into admissible and inadmissible subsets with \code{restrict.domain}.  The  "domain," or admissible geographic region, may be described by an object of class "\code{matrix}," "\code{Polygon}," "\code{Polygons}," "\code{SpatialPolygonsDataFrame}," or "\code{gpc.poly})."

This function does not distinguish between "islands" and "holes" and will issue a warning if holes are encountered.  Complex domains involving both islands and holes can be addressed by applying the function to first to islands, then to holes (or vice versa).
}
\value{
Returns a list that includes the following components:
\item{inside}{
        A list.  Elements include row indices in \code{x} and coordinates of points that fall within polygons of \code{domain}.
}
\item{outside}{
        A list.  Elements include row indices in \code{x} and coordinates of points that do not fall within polygons of \code{domain}.
}
}
\references{
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
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
data(xy.elk)
data(wica.bdy)
xy <- restrict.domain(x=xy.elk, domain=wica.bdy,fg="tan")
box()

str(xy)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ manip }
