\name{plot.Polygons}
\alias{plot.Polygons}
\title{
Polygon plotting
}
\description{
A plotting method for objects of class "\code{Polygons}"\{\pkg{sp}\}, which are used by \pkg{wild1} to represent animal home ranges.
}
\usage{
\method{plot}{Polygons}(x,...,fg=NULL,bg=NULL,add=FALSE)
}

\arguments{
  \item{x}{
        An object of class "\code{Polygons}"
}
  \item{fg}{
        Any legitimate plot color specification; usually a character string or number; specifies the fill color for "islands."
}
  \item{bg}{
        See \code{fg}; fill color for "holes."
}
  \item{add}{
        Logical. Create a new plot (\code{FALSE}) or add to an existing plot on the current output device (\code{TRUE}).
}
  \item{\dots}{
        Optional arguments to \code{\link{polygon}}.
}
}
\details{
   Plotting order is from the largest to the smallest polygon in \code{x} so that larger polygons do not obscure smaller ones.
}
\value{
Produces a plot (or annotates a plot) on the current output device.
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
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{colors}}, \code{\link{par}}
}
\examples{
data(wica.bdy)
data(xy.elk)

mcp <- hr.mcp(xy.elk,plot=FALSE)
plot(wica.bdy,col="tan")
plot(mcp,fg="gray",lty="44",add=TRUE)
plot(wica.bdy,add=TRUE,lwd=2)
points(xy.elk,pch=21,bg="blue")
box()
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ aplot }
\keyword{ hplot }

