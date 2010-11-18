\name{n.risk}
\alias{n.risk}
\title{
Number of records in a risk set
}
\description{
Returns the number of records in the risk set at each time represented in survival records. 
}
\usage{
n.risk(entry, exit, interval=1,...)
}
\arguments{
  \item{entry}{
       A data vector of class \code{"numeric"} or \code{"chron"}, representing times of entry for individuals in the risk set. 
}
  \item{exit}{
       A data vector of class \code{"numeric"} or \code{"chron"}, representing times of exit for individuals in the risk set.
}
  \item{interval}{
       A numeric value representing the measurement interval for time, \code{t}.  If entry and exit times are given by an object of class "\code{chron}," default unit is 1 day.  Tallies the risk set for each value  in \code{seq(from=entry+unit, to=exit, by=unit)}. 
}
  \item{...}{
  Optional arguments to \code{plot}.
}
}
\details{
Also produces a plot of risk set size vs. time.
}
\value{
An object of class \code{"dataframe"} with 2 columns:\cr
\item{ t }{ Event times in intervals defined by \code{(entry, exit]}.}
\item{ n }{ Number of records in risk set at time \code{t}.}
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
\seealso{
\code{\link{chron}}
}
\examples{
}
\keyword{ survival }
