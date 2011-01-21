\name{trim.xy}
\alias{trim.xy}
\title{
Identify and plot outlying points
}
\description{
Facilitates identification (hence exclusion) of influential, outlying points from spatial point patterns.
}
\usage{
trim.xy(x, y = NULL, exclude, center=c("median","mean"), maxiter=1000, plot=TRUE, ...)
}

\arguments{
  \item{x}{
        A vector, matrix, or data frame of coordinates
}
  \item{y}{
        A numeric vector (if \code{x} is a vector) or \code{NULL} 
}
  \item{exclude}{
        The proportion of points to be excluded
}
  \item{center}{
        Method used to identify outliers.  See "details." 
}
  \item{maxiter}{
        Maximum number of iterations for \code{\link{spatial.median}} 
}
  \item{plot}{
        Logical.  Produce a plot for inspection?
  }
  \item{\dots}{
        Optional arguments for \code{\link{spatial.median}}
}
}
\details{
By default, outlying points are those furthest from the spatial median.  Using the spatial median, rather than the mean (an available option), requires \pkg{\link{ICSNP}} and the iterative calculations are relatively slow.  However, use of the spatial median as a data trimming tool is advantageous when data contain highly influential, faulty values (which arise, not infrequently, from data recording or GPS errors).

Failures may be resolved by increasing the number of iterations for calculation of spatial medians.
}
\value{
Returns a list that includes the following components:
  \item{method}{
        \code{"median"} or \code{"mean"}
}
  \item{center}{
        Coordinates of spatial median or barycenter (mean of \code{x} and mean of \code{y})
}
  \item{inner}{
        A list describing the innermost 100 x \code{exclude} percent of points.  Components include the row index in \code{x}, coordinates, and distance to the center for each point.
}
  \item{outer}{
        A numeric matrix describing outlying points as in \code{inner}.
}
}
\references{
Norhausen, K., S. Sirkia, H. Oja, and D. E. Tyler. ICSNP: Tools for Multivariate Nonparametrics. <http://CRAN.R-project.org/package=ICSNP>.
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
data(wica.bdy)
data(xy.elk)
xy.95 <- trim.xy(x=xy.elk,exclude=0.05)
str(xy.95)

mcp <- hr.mcp(x=xy.elk,plot=FALSE)
mcp95 <- hr.mcp(x=xy.95$inner$coords,plot=FALSE)

plot.new()
plot.window(xlim=c(611589,634220),
  ylim=c(4816477,4833102),asp=1)
plot(wica.bdy,col="tan",add=TRUE)
points(xy.95$inner$coords,pch=21,bg="salmon")
points(xy.95$outer$coords,pch=21,bg="gray")
plot(mcp,add=TRUE,lty=2)
plot(mcp95,add=TRUE,lty=3)
box()
mtext("95 and 100 percent MCP home ranges")
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ manip }
