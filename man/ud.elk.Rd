\name{ud.elk}
\alias{ud.elk}
\docType{data}
\title{
Example of a utilization distribution
}
\description{
An object oc class "\code{kde}"\{\pkg{ks}\} representing the utilization distribution for an elk.  Estimated with \code{\link{ud.kde}} from sample data provided by \code{\link{xy.elk}}. 
}
\usage{data(ud.elk)}
\format{
A list.
}
\source{
For demonstration use only.  Not for biological interpretation.
}
\examples{
data(ud.elk)
data(xy.elk)
hr <- hr.kde(ud.elk,level=1)
plot(hr,fg="tan")
points(xy.elk,pch=21,bg="gray")
}
\keyword{datasets}
