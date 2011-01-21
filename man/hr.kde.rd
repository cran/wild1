\name{hr.kde}
\alias{hr.kde}
\title{
Home range estimation
}
\description{
Compute a kernel density estimate of "home range" 
}
\usage{
hr.kde(x, level, plot=TRUE, add=FALSE, ...)
}

\arguments{
  \item{x}{
        For \code{hr.kde}, an object of class "\code{kde}", e.g., a utilization distribution produced by \code{\link{ud.kde}}.
}
  \item{level}{
        A scalar in (0,1].  Density isopleth, e.g., 0.95 returns a 95\% kernel density home range estimate. 
}
  \item{plot}{
        Logical. Produce a plot?
}
  \item{add}{
        Logical.  Add to an existing plot on the current output device?
}
  \item{\dots}{
        Not implemented.       
}
}
\details{
See \code{\link{plot.Polygons}} for another way of plotting polygon objects.
}
\value{
Returns an object of class "\code{Polygons}"\{\pkg{sp}\}
}
\references{
Duong, T. ks: Kernel smoothing. <http://CRAN.R-project.org/package=ks>
}
\author{
Glen A. Sargeant\cr
U.S. Geological Survey\cr
Northern Prairie Wildlife Research Center\cr
\email{glen_sargeant@usgs.gov}
}
\note{
}

\section{Warning }{This function could possibly return an incomplete polygon in some cases.  I have not seen such an outcome, but, for safety, recommend inspection of diagnostic plots.}

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
data(xy.elk)
idx <- round(seq(1,nrow(xy.elk),length.out=100))
xy <- xy.elk[idx,]
ud <- ud.kde(xy)
str(ud)

hr <- hr.kde(ud,level=0.95)

plot(xy.elk,pch=21,col=gray(0.85))
points(xy,pch=21,bg="red")
plot(hr,lty=2,add=TRUE)
mtext("95 percent kernel density estimate")
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ aplot }
\keyword{ hplot }

