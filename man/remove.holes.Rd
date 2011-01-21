\name{remove.holes}
\alias{remove.holes}
\title{
Remove holes from "Polygons" object
}
\description{
Given an object of class "\code{Polygons}"\{\pkg{sp}\}, returns a similar object but without any "\code{Polygon}"\{\pkg{sp}\} components that described "holes."
}
\usage{
remove.holes(Poly)
}

\arguments{
  \item{Poly}{
        An object of class "\code{Polygons}"
}
}
\details{
Objects of class "\code{Polygons}" are used by \pkg{wild1} to describe home ranges of animals.  See \pkg{\link{sp}} for the class description.
}
\value{
Returns an object of class "\code{Polygons}"
}
\references{
Bivand, R. S., E. J. Pebesma, and V. Gomez-Rubio, 2008. Applied spatial data analysis with R. Springer, NY.
  <http://www.asdar-book.org/>

Pebesma, E.J., R.S. Bivand, 2005. Classes and methods for spatial data in R. R News 5 (2).
  <http://cran.r-project.org/doc/Rnews/>
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
data(wica.hole.gpc)
p <- gpc.to.Polygons(wica.hole.gpc)
par(mfrow=c(1,2))
plot(p)
plot(remove.holes(p))

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ manip }
