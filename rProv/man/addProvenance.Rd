\name{addProvenance}
\alias{addProvenance}
\title{Compute and add the provenance information}
\description{
  This function is the default function used
  to assemble and add the provenance information
  to the return value of a function.
  It is added to a function using \code{\link{provenanceTrace}}.
}
\usage{
addProvenance(obj, calls = sys.calls(), frames = sys.frames(), nframe = sys.nframe(), files = NULL, ...)
}
\arguments{
  \item{obj}{the R object whose provenance is to be computed and stored}
  \item{calls}{the system calls}
  \item{frames}{the call frames}
  \item{nframe}{the frame number}
  \item{files}{the file or external  objects which we may want to track}
  \item{\dots}{additional parameters which are currently ignored}
}
\value{
  This function returns \code{obj} with   additional attributes.
}
\author{Duncan Temple Lang}

\seealso{
  \code{\link{provenanceTrace}}
}
\examples{
 addProvenance(1:10)
}
\keyword{programming}
\concept{provenance}
\concept{reproducability}
