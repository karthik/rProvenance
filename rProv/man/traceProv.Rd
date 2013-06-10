\name{traceProv}
\alias{traceProv}
\alias{provenanceTrace}
\title{Add provenance capturing code to functions}
\description{
  These functions modify an existing function to add
  calls to capture provenance information.
  They identify the return expressions that return a value and
  changes these to call
   a function that captures the provenance information
  and attaches it to the object that will be returned.
}
\usage{
traceProv(fun, op = as.name("addProvenance"), enter = NULL, addLoopCounters = containsLoops(fun), recursive = TRUE)
provenanceTrace(fun, op = as.name("addProvenance"), enter = NULL, addLoopCounters = containsLoops(fun), files =  character()) 
}
\arguments{
  \item{fun}{the function whose body is to be modified to include  provenance }
  \item{op}{the name of the function which will be called to gather and
    attach the provenance information.}
  \item{enter}{any additional code that is to be added at the start of
    the function.}
  \item{addLoopCounters}{a logical value that controls whether the }
  \item{recursive}{a logical value which controls whether we add
    provenance information to  the  functions that this function calls}
  \item{files}{the names of variables that identify external resources
    whose information we want to trace.}
}
\value{
 These functions return the modified function(s).
}
\author{
Duncan Temple Lang
}
\seealso{
  \code{\link{getSessionProvInfo}}
}
\examples{
code = system.file("sampleFuns", "readData.R", package = "rProv")
source(code)
readData = provenanceTrace(readData)

f = system.file("sampleData", "mtcars.csv", package = "rProv")
z = readData(f)
getProvInfo(z)
f = system.file("sampleData", "mtcars.rda", package = "rProv")
z = readData(f)
getProvInfo(z)


# Here we add information to identify a file and capture information
# about that file.
readData = provenanceTrace(readData, files = "filename")
f = system.file("sampleData", "mtcars.csv", package = "rProv")
z = readData(f)
getProvInfo(z)
}
\keyword{programming}
\concept{provenance}
\concept{reproducability}

