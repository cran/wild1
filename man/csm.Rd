\name{csm}
\alias{csm}
\title{
Cause-specific estimates of mortality
}
\description{
An implementation of the nonparametric cumulative incidence function estimator described by Heisey and Patterson (2006). Permits staggered entry ("left truncation" in survival literature).
}
\usage{
csm(entry, exit, event, fate, cause, alpha = 0.10)
}
\arguments{
  \item{entry}{
       A data vector of class \code{"numeric"}, \code{integer}, or \code{"chron"}, representing times of entry for individuals in the risk set. 
}
  \item{exit}{
       A data vector of class \code{"numeric"}, \code{integer}, or \code{"chron"}, representing times of exit for individuals in the risk set.
}
  \item{event}{
       A data vector of class \code{"numeric"}, \code{integer}, or \code{"logical"} describing departures of individuals from the risk set (\code{0} or \code{FALSE} denotes censoring; \code{1} or \code{TRUE} denotes an event). 
}
  \item{fate}{
       A data vector of class \code{"numeric"}, \code{"character"}, or \code{"factor"} describing fates of individuals.
}
  \item{cause}{
       A vector of class \code{"numeric"}, \code{integer}, or \code{"character"} specifying fates attributed to the cause of interest.  For example, several fates [\code{c("hunting","poaching","vehicle strike")}] might be included in an estimate of anthropogenic mortality.   
}
  \item{alpha}{
       Optional alpha level used to compute 100*(1-alpha/2)\% upper and lower bounds (a 100*(1-alpha)\% confidence interval) for the cumulative incidence function.  Default is 0.10 (90\% confidence interval).
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
An object of classes \code{"dataframe"} and \code{"csm"}.\cr
\cr
Columns include the following:\cr
\cr
\item{ time }{Event time}
\item{ n.event.all }{Number of events (all causes) occurring at \code{time}}
\item{ n.risk.all }{Number of individuals at risk at \code{time}}
\item{ survival.all }{Kaplan-Meier estimate of survival (all causes)}
\item{ n.event.s }{Number of events due to fates in \code{cause} at \code{time}}
\item{ n.risk.s }{Number of individuals at risk at \code{time}}
\item{ survival.s }{ Kaplan-Meier survival estimate obtained by censoring mortalities due to fates not in \code{cause}}
\item{ mort.rate }{Interval mortality rate}
\item{ CIF }{Cumulative incidence function estimate of mortality}
\item{ cumvar }{Variance of \code{CIF}}
\item{ SE }{Standard error of \code{CIF}}
\item{ ucl }{Upper 100*(1-alpha)\% confidence limit for CIF}
\item{ lcl }{Lower 100*(1-alpha)\% confidence limit for CIF}
}
\references{
Heisey, D. M., and B. R. Patterson. 2006. A review of methods to estimate cause-specific mortality in presence of competing risks. Journal of Wildlife Management 70(6):1544-1555 
}
\author{
Glen A. Sargeant\cr
U.S. Geological Survey\cr
Northern Prairie Wildlife Research Center\cr
\email{glen_sargeant@usgs.gov}
}
\note{
Modified from SPLUS code provided by Heisey and Patterson (2006) to 1) run in R, 2) permit more flexible input, 3) check data for a number of foreseeable errors, 4) support grouping of fates as a single cause, and 5) facilitate operations with output.

Intervals defined by \code{entry} and \code{exit} are open on the left and closed on the right, i.e., event time is given by \code{exit} and interval is \code{(entry, exit]}.

}
\seealso{
\code{\link{chron}}
}
\examples{
}
\keyword{ survival }
