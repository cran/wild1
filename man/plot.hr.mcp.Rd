\name{plot.hr.mcp}
\alias{plot.hr.mcp}
\title{
Plot method for class "hr.mcp"
}
\description{
Plotting method for objects produced with \code{hr.mcp}\{\pkg{wild1}\}. Designed to integrate with \pkg{graphics}.
}
\usage{
\method{plot}{hr.mcp}(x, id=TRUE, axes=FALSE, add=FALSE, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
An object of class \code{hr.mcp}
}
  \item{id}{
Logical.  Label plot with character string given by \code{hr.mcp$id}?
}
  \item{axes}{
Include axes and axis labels?}
  \item{add}{
Add plot to current figure?
}
  \item{\dots}{
Optional \code{xlim} and \code{ylim} arguments if \code{add=FALSE}; optional arguments for \code{\link{polygon}}; see \code{\link{par}}. 
}
}
\details{
}
\value{
Produces a plot on the current output device or adds a polygon to the current plot
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
\code{\link{hr.mcp}}
}
\examples{
#Matrix of locations
data(xy.elk)

#Boundary of study area
data(wica.bdy)

#Home range
hr1 <- hr.mcp(x=xy.elk,id="Example 1",exclude=0.10)
hr2 <- hr.mcp(x=xy.elk,exclude=0.05)
hr3 <- hr.mcp(x=xy.elk,exclude=0.01)

#plot.hr.mcp is designed to integrate
#with the R 'graphics' package
xlm <- range(xy.elk$x,na.rm=TRUE)
ylm <- range(xy.elk$y,na.rm=TRUE)
plot(hr3,lty=2,xlim=xlm,ylim=ylm,col="gray90")
plot(hr2,lty=2,xlim=xlm,ylim=ylm,col="gray80",add=TRUE)
plot(hr1,lty=2,xlim=xlm,ylim=ylm,col="gray70",add=TRUE)
points(xy.elk,col="tan1",cex=0.75,pch=19)
points(xy.elk,cex=0.75)
plot(wica.bdy,add=TRUE)

box()

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ hplot }
\keyword{ aplot }
