\name{plot.csm}
\alias{plot.csm}
\title{
Plotting method for objects of class "csm"
}
\description{
A plotting method for class \code{csm}.  Produces survival curves similar to those produced by default with \code{plot.survfit()} in package \pkg{survival}. 
}
\usage{
\method{plot}{csm}(x,firstx=0,lastx=365,alpha=0.10,add=FALSE,ylim=NULL,axes=TRUE,
  href=TRUE,xlab="t",ylab="S(t)",lty=1,
  lty.ref="88",
  lty.ci=2,
  lwd=1,
  lwd.ref=1,
  lwd.ci=1,
  cex.lab=1,
  cex.axis=1,
  col.ref="gray60",
  col.ci="black",
  marks=NULL,
  cex.marks=1,...)
}

\arguments{
  \item{x}{
    An object of class \code{"csm"} produced by \code{\link{csm}}.
}
  \item{firstx}{
    Starting point for the survival curve.
}
  \item{lastx}{
    Ending point for the survival curve.
}
  \item{alpha}{
        Either the alpha level for a 100*(1-alpha) confidence interval or \code{NULL} to suppress plotting of confidence limits.
}
  \item{add}{
        A logical value.  Specify \code{TRUE} to add a survival curve to the current plot (default is \code{FALSE}).
}
  \item{ylim}{
    Limits for y axis. The range of estimates and confidence limits is used if \code{ylim} is \code{NULL} (the default).
}
  \item{axes}{
    Logical value controlling plotting of axes.  \code{FALSE} suppresses plotting of axes.  Default is \code{TRUE}.
}
  \item{href}{
    Logical value that controls plotting of a horizontal reference line corresponding with survival at \code{lastx}.  Default is \code{TRUE}.  See \code{\link{abline}}.
}
  \item{xlab}{
    Logical value that controls labeling of the x axis.  \code{FALSE} suppresses the axis label.  The default is \code{TRUE}.
}
  \item{ylab}{
    Logical value that controls labeling of the y axis.  \code{FALSE} suppresses the axis label.  The default is \code{TRUE}.
}
  \item{lty}{
    Line type. See \code{\link{par}}.
}
  \item{lty.ref}{
    Line type for horizontal reference line. See \code{\link{par}}.
}
  \item{lty.ci}{
    Line type for confidence limits. See \code{\link{par}}.
}
  \item{lwd}{
  Numeric value that controls line width.  See \code{\link{par}}.
}
  \item{lwd.ref}{
  Numeric value that controls line width for horizontal reference line (if plotted).  See \code{\link{par}}.
}
  \item{lwd.ci}{
  Numeric value that controls line width for confidence limits (if plotted).  See \code{\link{par}}.
}
  \item{cex.lab}{
  Numeric value that controls the size of axis labels.  See \code{\link{par}}.
}
  \item{cex.axis}{
  Numeric value that controls the size of axis scales.  See \code{\link{par}}.
}
  \item{col.ref}{
  Controls color of horizontal reference line.
}
  \item{col.ci}{
  Controls color of confidence limits.
}
  \item{marks}{
  The survival curve will be marked at corresponding locations on the x axis to represent, e.g., censoring times.
}
  \item{cex.marks}{
  Numeric value that controls line width for marks.  See \code{\link{par}}.
}
  \item{\dots}{
  Not implemented. 
}
}
\details{
Use \code{\link{example}} for examples of typical applications.
}
\value{
Produces a figure on the current output device.
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
\code{\link{csm}}
}
\examples{
#Sample data
data(coyote.mort)

#Estimates of cause-specific mortality
harvest <- c("snare","trap","shot")
harvest.csm <- with(coyote.mort,
  csm(entry=entry, exit=exit, event=event, 
    fate=fate, cause=harvest, alpha=0.10)
)
other <- c("strife","car","unknown nat")
other.csm <- with(coyote.mort,
  csm(entry=entry, exit=exit, event=event, 
    fate=fate, cause=other, alpha=0.10)
)

#Plot 1 survival curve with 90% confidence limits
plot(harvest.csm)

#Plot both survival curves
plot(harvest.csm,alpha=NULL,href=FALSE,ylim=c(0,1))
par(new=TRUE)
plot(other.csm,alpha=NULL,add=TRUE,href=FALSE,lty=2)
legend(x="bottomleft",legend=c("Harvest", "Other"),lty=c(1,2))
}
\keyword{ hplot }
\keyword{ survival }
