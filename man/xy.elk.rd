\name{xy.elk}
\alias{xy.elk}
\docType{data}
\title{
Locations of an elk
}
\description{
A sample data frame of UTM coordinates for an elk marked with a GPS collar at Wind Cave National Park, South Dakota. 
}
\usage{data(xy.elk)}
\format{
  A data frame with 2444 observations on the following 2 variables.
  \describe{
    \item{\code{x}}{a numeric vector}
    \item{\code{y}}{a numeric vector}
  }
}
\source{
For demonstration use only.  Not for biological interpretation.
}
\examples{
data(xy.elk)
data(wica.bdy)
plot(wica.bdy,col="gray")
plot(xy.elk,pch=19,col="salmon")
par(new=TRUE)
plot(xy.elk)
}
\keyword{datasets}
