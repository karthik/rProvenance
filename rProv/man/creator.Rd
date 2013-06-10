\name{creator}
\alias{creator}
\alias{rng}
\alias{sys}
\alias{when}
\alias{pid}
\alias{session}
\alias{setProvInfo}
\alias{getProvInfo}
\alias{getSessionProvInfo}
\title{Functions to access details of the provenance information}
\description{
  These functions allow us to retrieve or set the provenance information
  and also query particular aspects of that  collected provenance
  information.

  \code{getSessionProvInfo} is used to create the provenance for the
  R objects created at the top-level, i.e. interactively.
}
\usage{
creator(obj, info = getProvInfo(obj))
getProvInfo(obj)
setProvInfo(obj, info)
}
\arguments{
  \item{obj}{the object which has provenance information}
  \item{info}{the provenance information, typically extracted from the
    data object}
}
\value{
  These functions return different elements of the
  provenance information.

  \code{getProvInfo} returns the entire provenance information for the object.
}
\author{
Duncan Temple Lang
}

\seealso{
 \code{\link{startProv}}
}
%\examples{}
\keyword{programming}
\concept{provenance}



