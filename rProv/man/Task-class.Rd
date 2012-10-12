\name{Task-class}
\Rdversion{1.1}
\docType{class}
\alias{Task-class}
\alias{AssignTask-class}
\alias{SubAssignTask-class}
\alias{ProvenanceTask-class}
\alias{PlotTask-class}
\alias{GRZPlotTask-class}
\alias{LatticePlotTask-class}

\title{Classes for Representing Top-level Tasks}
\description{
  These classes are used to represent R expressions or commands
  given at the prompt. They are used to indicate the nature of the
  task (e.g. a plot, an assignment, a replacement operation within an
  object), and also capture information about when the command was
  completed  and the type/class of the result.
}
\section{Objects from the Class}{
  Objects can be created by calls of the form \code{new("Task", ...)}
  or via the more general and capable \code{Task} constructor function.
}
\section{Slots}{
  \describe{
    \item{\code{expression}:}{Object of class \code{"ANY"} the top-level
      R command
      or expression  }
    \item{\code{status}:}{Object of class \code{"logical"} a logical
      value giving the status of the command. Currently, this is always \code{TRUE}.}
    \item{\code{time}:}{Object of class \code{"POSIXct"} giving the time
    the command completed. }
    \item{\code{visible}:}{Object of class \code{"logical"} indicating
      whether the result was printed or not. }
  }
}
\section{Methods}{
No methods defined with class "Task" in the signature.
}
\author{
DTL
}


\seealso{
 \code{CodeDepends} package.
}
\examples{
showClass("Task")
}
\keyword{classes}
