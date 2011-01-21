\name{point.in.Polygons}
\alias{point.in.Polygons}
\title{
Points encompassed by a "Polygons" object
}
\description{
Extends \code{point.in.polygon}\{\pkg{sp}\} for application to objects of class "\code{Polygons}."  Returns either points that are in any polygon, a logical vector identifying such points, or a matrix indicating membership for each point and polygon.
}
\usage{
point.in.Polygons(x,y=NULL,Poly,output=c("points","logical","matrix"),...)
}

\arguments{
  \item{x}{
        A vector, matrix, or data frame of coordinates
}
  \item{y}{
        A numeric vector (if \code{x} is a vector) or \code{NULL} 
}
  \item{Poly}{
        An object of class "\code{Polygons}"
}
  \item{output}{
        A character string; either \code{"points"}, \code{"logical"} or \code{"matrix"}.
}
  \item{\dots}{
        Optional arguments to \code{\link{point.in.polygon}}.
}
}

\details{
Points are "in" if they are not strictly exterior to polygons in \code{Poly} (vertices and points on the boundary are included).

See also \code{\link{overlay}}\{\pkg{sp}\}, which returns a vector with '1' indicating membership in a polygon.
}
\value{
If \code{output="points"}, returns points that fall in any polygon.
If \code{output="logical"}, returns a logical vector (\code{TRUE} for points that fall within any polygon).
If \code{output="matrix"}, returns a logical matrix with 1 column for each polygon in \code{Poly} and 1 row for each point in \code{x}; values indicate inclusion in specific polygons.
}
\references{
Uses the C function InPoly(), in gstat file polygon.c; InPoly is Copyright (c) 1998 by Joseph O'Rourke. It may be freely redistributed in its entirety provided that this copyright notice is not removed. 
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
\code{\link{overlay}}
}
\examples{
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ manip }
