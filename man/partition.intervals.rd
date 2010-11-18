\name{partition.intervals}
\alias{partition.intervals}
\title{
Partition interval data into subintervals
}
\description{
Partitions temporal intervals or intervals on a number line into subintervals. If an event was associated with the original record for an individual prior to translation, it will be associated with the final record for the same individual after partitioning.
}
\usage{
partition.intervals(first,last,breaks,recurrent=TRUE,labels=NULL,id=NULL,event=NULL,no.event=NULL)
}
%- maybe also 'usage' for other objects documented here.
\arguments{

\item{first}{
A vector.  First observation time for each individual.
}
\item{last}{
A vector.  Last observation time for each individual.
}
\item{breaks}{
A vector of breaks that define monitoring periods.  Periods are open on the left and closed on the right.
}
\item{recurrent}{
If \code{TRUE}, the origin of each subinterval will be translated to 0 (very useful for creating survival records with recurrent origins) 
}
\item{labels}{
A vector of labels for monitoring periods.  Length must be 1 less than the number of breakpoints.
}
\item{id}{
A vector of individual identifiers for observations represented by \code{first} and \code{last}.
}
\item{event}{
Optional.  Vector of outcomes for individuals.  In survival analysis, this value indicates whether or not an event occurred.
}
\item{no.event}{
Value of \code{event} that indicates no event occurred.  Required if and only if \code{event} is supplied.  
}
}

\details{
Typical use is for survival analysis, but may also be used for other types of data, e.g., to subdivide a transect line into segments that share a common origin.
}
\value{
Returns a data frame.
}
\author{
Glen A. Sargeant\cr
U.S. Geological Survey\cr
Northern Prairie Wildlife Research Center\cr
\email{glen_sargeant@usgs.gov}
}

\examples{

set.seed(1)
breaks <- seq(chron("1/1/2008","00:00:00"),by="years",length=3)
labels <- as.character(2008:2009)
diff(breaks)

first <- chron(runif(10,breaks[1],breaks[2]))
last <- chron(runif(10,first,breaks[3]))
event <- rbinom(10,1,0.5)

data.frame(first,last,event)

not.recur <- partition.intervals(first=first,last=last,breaks=breaks,recurrent=FALSE,labels=labels)

recur <- partition.intervals(first=first,last=last,breaks=breaks,labels=labels,
 event=event,no.event=0)
 
cbind(not.recur,recur)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ manip }
\keyword{ survival }
