\name{startProv}
\alias{startProv}
\alias{provCallback}
\title{Start collecting top-level command task information}
\description{
  These functions provide facilities for collecting provenance
  information about  top-level R commands/expressions.
  We can start collecting tasks and then temporarily suspend
  and restart the collection at any time.
  We can also query the current history of tasks and also reset the list.
  The tasks are collected and converted to S4 objects that identify the
  nature
  of the task, e.g. assignment, replacement operation (within an
  object), a plot task, and so on.
}
\usage{
startProv(cb = provCallback())
provCallback()
}
\arguments{
  \item{cb}{a list of functions or a single function object with an
    element named handler. This used to register a function with
    \code{\link[base]{addTaskCallback}}.
    }
}

\value{
  \code{provCallback} returns list with of functions. \code{handler} is the function
  used by \code{addTaskCallback} to process each top-level task.
  This stores each task in a local list.

  \code{tasks} is an accessor function to retrieve the current state of
  the list.

  \code{pause} and \code{resume} allow us to dynamically stop and
  restart collecting tasks without removing the task callback, i.e.
  we are just making it dormant and then reactivating it.

  \code{reset} clears the current set of tasks and continues to collect
  the tasks.

  \code{startProv} returns its argument, with the idea being that
  we can use the default value and have a way to retrieve the tasks as
  they are collected.
}
\note{We may want the handler function to omit or explicitly identify
  provenance related tasks so that they are not mixed with
  regular tasks. We can give these operations classes and then filter them.
}

\author{
Duncan Temple Lang
}

\seealso{
  \code{\link{addTaskCallback}}
  \code{\link{Task-class}}
}
  
\examples{

.prov = startProv()
x = 1:10
y = 2 + 5 * x
x[2:4] = rnorm(3) # doesn't change y.
plot(x, y)

tasks = .prov$tasks()
sapply(tasks, class)

sapply(tasks[sapply(tasks, is, "AssignTask")],  slot, "symName")
}
\keyword{programming}
\concept{provenance}