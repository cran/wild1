\name{ud.kde}
\alias{ud.kde}
\title{
Utilization distributions
}
\description{
Compute a kernel density estimate of a utilization distribution
}
\usage{
ud.kde(x, y=NULL,H=NULL,n.min=50,...)
}

\arguments{
  \item{x}{
        A vector, matrix, or data frame of coordinates
}
  \item{y}{
        A numeric vector (if \code{x} is a vector) or \code{NULL} 
}
  \item{H}{
        A bandwidth matrix; default is an unconstrained bandwidth matrix estimated from the data with \code{\link{Hscv}} (see \code{\link{kde}} and \pkg{\link{ks}})
}
  \item{n.min}{
        Returns \code{NA} and a warning if the number of observations is less than \code{n.min}.
}
  \item{\dots}{
        Optional arguments to \code{\link{kde}}
}
}
\details{
A wrapper for \code{\link{kde}}.  

Calculation of the bandwidth matrix is regrettably slow for large data sets.
}
\value{
Returns an object of class "\code{kde}"\{\pkg{ks}\}
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

%% ~Make other sections like Warning with \section{Warning }{....} ~

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
\keyword{ smooth }

