\name{hr.mcp}
\alias{hr.mcp}
\title{
Home range estimation
}
\description{
Compute and plot a minimum convex polygon estimate of "home range" 
}
\usage{
hr.mcp(x,y=NULL,n.min=50,plot=TRUE,add=FALSE,ID=NULL,...)
}

\arguments{
  \item{x}{
        A vector, matrix, or data frame of coordinates.
}
  \item{y}{
        A numeric vector (if \code{x} is a vector) or \code{NULL} 
}
  \item{n.min}{
        If \code{x} includes fewer than \code{n.min} points, the function will return \code{NA} and a warning.
}
  \item{plot}{
        Logical. Produce a plot?
}
  \item{add}{
        Logical. Add to existing plot on current output device?  Default is \code{FALSE}.
}
  \item{ID}{
        Required argument from \code{\link{Polygons}}
}
  \item{\dots}{
        Optional arguments for \code{\link{plot}} or \code{\link{points}} (see also \code{\link{par}}).
}
}
\details{
See \code{\link{plot.Polygons}} for another way of plotting polygon objects.
}
\value{
Returns an object of class "\code{Polygons}"\{\pkg{sp}\}
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
Replaces \code{hr.mcp} in versions 1.xx
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
data(wica.bdy)
data(xy.elk)

bb <- bbox(as.matrix(xy.elk))
plot(wica.bdy,xlim=bb[1,],ylim=bb[2,],col="tan")
mcp <- hr.mcp(x=xy.elk,pch=21,bg="salmon",lty=2,add=TRUE)
box()

str(mcp)
mcp@area/1000^2
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ aplot }
\keyword{ hplot }

