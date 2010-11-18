\name{coyote.mort}
\alias{coyote.mort}
\docType{data}
\title{
Survival records for coyotes
}
\description{
Example data used by Heisey and Patterson (2006) to demonstrate methods for estimating cause-specific mortality from left-truncated survival records.  
}
\usage{data(coyote.mort)}
\format{
  A data frame with 97 observations on the following 9 variables.
  \describe{
    \item{\code{gender}}{a factor with levels \code{female} \code{male}}
    \item{\code{age}}{a numeric (integer) vector}
    \item{\code{id}}{a character vector}
    \item{\code{area}}{a factor with levels \code{"1"}, \code{"2"}, and \code{"3"}}
    \item{\code{year}}{an ordered factor with levels \code{"1992" < "1993" < \ldots}}
    \item{\code{entry}}{a numeric (integer) vector}
    \item{\code{exit}}{a numeric (integer) vector}
    \item{\code{event}}{a numeric (integer) vector}
    \item{\code{fate}}{a factor with levels \code{"car"}, \code{"shot"}, \code{\ldots}; \code{NA} for individuals that survived.}
  }
}
\details{
}
\source{
Provided by and used with permission of Brent Patterson.
}
\references{
Heisey, D. M., and B. R. Patterson. 2006. A review of methods to estimate cause-specific mortality in presence of competing risks. Journal of Wildlife Management 70(6):1544-1555.
}
\examples{
data(coyote.mort)
str(coyote.mort) 
}
\keyword{datasets}
