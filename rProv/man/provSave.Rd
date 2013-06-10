\name{provSave}
\alias{provSave}
\title{Save an R object with provenance information}
\description{
  This function
}
\usage{
provSave(obj, file, name = deparse(substitute(obj)), dependsCommandsOnly = FALSE)
}
\arguments{
  \item{obj}{the object to serialize}
  \item{file}{the name of the file to which the object(s) will be
    serialized. This is passed to \code{\link[base]{save}} as the
    \code{file} argument.}
  \item{name}{the name of the object being serialized}
  \item{dependsCommandsOnly}{a logical value controlling whether we
    store only the object along with how to recreate it from first
    principles, or whether we store all of the objects on which this  object depends.
   }
}
\value{
 The name of the file or connection object to which the object(s) are
 serialized.  See \code{\link[base]{save}}.
}

\author{
Duncan Temple Lang
}
\seealso{
 \code{\link[base]{save}}
}
\examples{
x =  rnorm(100)
y = 3 + 7 * x + rnorm(length(x))
fit = lm(y ~ x)

d = data.frame(a = y, b = x)
fit1 = lm(a ~ b, d)

provSave(fit1, "bob.rda")
provSave(fit1, "bob.rda", depends = TRUE)
}
\keyword{programming}
\concept{provenance}
\concept{reproducability}
