\name{xyt.elk}
\alias{xyt.elk}
\docType{data}
\title{
Locations of an elk
}
\description{
A sample data frame of UTM coordinates for an elk marked with a GPS collar at Wind Cave National Park, South Dakota. 
}
\usage{data(xyt.elk)}
\format{
  A data frame with observations on the following variables:
  \describe{
    \item{\code{t}}{a vector of dates and times; see \code{\link{chron}}}
    \item{\code{x}}{a numeric vector}
    \item{\code{y}}{a numeric vector}
  }
}
\source{
For demonstration use only.  Not for biological interpretation.
}
\examples{
data(xyt.elk)
str(xyt.elk)
data(wica.bdy)
plot(wica.bdy,col="gray")
plot(xyt.elk[,c("x","y")],pch=21,col="salmon")
}
\keyword{datasets}
