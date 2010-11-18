\name{point.in.hr}
\alias{point.in.hr}
\title{
Classify points as "in" or "out" of a home range
}
\description{
Extracts vertices of a home range polygon and classifies points as inside or outside the polygon.  A wrapper for \code{point.in.polygon} from \pkg{sp}.  
}
\usage{
point.in.hr(x,y=NULL,hr.mcp)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
Vector of x coordinates or 2-column matrix or data frame of x and y coordinates for points on a square grid
}
  \item{y}{
Optional vector of y coordinates
}
  \item{hr.mcp}{
An object of class "hr.mcp"
}
}
\details{
}
\value{
An integer vector; values are 0, point is strictly exterior to home range; 1, point is strictly interior to home range; 2, point lies on relative interior of an edge of home range; 3, point is a vertex of home range
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
\code{\link{point.in.polygon}} uses the C function InPoly() in gstat file polygon.c; InPoly is Copyright (c) 1998 by Joseph O'Rourke.  It may be freely distributed in its entirety provided that this copyright notice is not removed.
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{point.in.polygon}}
}
\examples{
#Matrix of locations
data(xy.elk)

#Boundary of study area
data(wica.bdy)

#Home range
hr <- hr.mcp(x=xy.elk,id="Example 1",exclude=0.10)

#Which points in home range?
outside <- point.in.hr(x=xy.elk,hr=hr)==0
inside <- point.in.hr(x=xy.elk,hr=hr)==1
vertex <- point.in.hr(x=xy.elk,hr=hr)==3

#plot.hr.mcp is designed to integrate
#with the R 'graphics' package
xlm <- range(xy.elk$x,na.rm=TRUE)
ylm <- range(xy.elk$y,na.rm=TRUE)
plot(hr,lty=2,xlim=xlm,ylim=ylm,col="gray")
points(xy.elk[outside,],col="gray",cex=0.75,pch=19)
points(xy.elk[inside,],col="tan1",cex=0.75,pch=19)
points(xy.elk,cex=0.75)
points(xy.elk[vertex,],col="red",cex=1.2,pch=17)
points(xy.elk[vertex,],cex=1.2,pch=2)
plot(wica.bdy,add=TRUE)
box()

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ manip }
