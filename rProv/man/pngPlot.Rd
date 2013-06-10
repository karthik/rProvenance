\name{pngPlot}
\alias{pngPlot}
\title{Create a PNG plot within R with meta data}
\description{
  This function is a simple wrapper for the
  \code{\link[grDevices]{png}} graphics device
  to create a plot as a PNG image.
  The purpose of this function is to add meta-data
  to the PNG image to include information about
  how the plot was created and the R session info
  in which it was created.  The aim is to allow
  a person viewing a plot to query how it was created
  and to be able to, for example, visit a URL  to
  access the inputs for the plot and their provenance information.

  One can use this plot either directly in an R session by specifying
  the entire code for the plot as the first argument.  Alternatively,
  it is very straightforward to use this device when processing a
  code chunk in a dynamic document such as Sweave, knitr, XDynDocs,
  odfWeave or RWordXML.

  This is an atomic operation to create the plot, meaning that
  one cannot add content to the plot within after this call.
}
\usage{
pngPlot(code, file = character(), ..., meta = getSessionProvInfo(substitute(code)))
}
\arguments{
  \item{code}{the R code to create the entire plot}
  \item{file}{the name of the file or a connection object to which the
  image will be written. If this is omitted or \code{NULL}, the image is
  stored in memory as a \code{raw} vector}
  \item{\dots}{additional arguments passed to the regular
    \code{\link[grDevices]{png}}
    graphics device function.
}
  \item{meta}{a named character vector or list of meta data elements
  that are to be stored in the PNG image.  Elements which are not simple
  strings are serialized as R objects and encoded as base 64.
  To store them in another format, e.g. JSON, convert them before the
  call to \code{pngPlot}.}
}
\value{
  If \code{file} is not \code{NULL}, then \code{file} is returned.

  If \code{file} is \code{NULL}, a raw vector containing the image.
}
\references{
\code{png} package by Simon Urbanek
}
\author{
Duncan Temple Lang
}
\seealso{
  \code{\link[grDevices]{png}},
  \code{\link[png]{readPNG}}
  \code{\link[png]{writePNG}}
}
\examples{
  o = pngPlot(plot(rnorm))
}
\keyword{graphics}
\keyword{IO}
\concept{provenance}

