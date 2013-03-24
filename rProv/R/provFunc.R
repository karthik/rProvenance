provenanceTrace =
  #
  # add code to the return expression of the function (either explicit return or the last expression)
  # that is a call to op
  #
  #  See RLLVMCompile for code to do the rewriting. Merge.
  #
  # Totally not wedded to these names or implementation. Just putting these here.
  #
  #  We may want to capture information such  as the value of .Random.seed or simply the current time (Sys.time())
  # when we enter the function.
  # In a loop, we may want to capture the number of iterations before we exit the loop
  # So we may want to add code to the top of the function and include that in the call to the provenance function
  #
  #  When reading data, we want to capture the name of the file or URL, the current date and time.
  #  Within a call to readLines(), we may want to identify the line numbers being read or the start and ending
  #  position in the connection.
  #
  #  Push the provenance information and data to a central repository.
  #
  #  Grab the process id, time stamp, etc.
  #
  #
  #
  #
function(fun, op = as.name("addProvenance"),
          addLoopCounters = containsLoops(fun))
{
  b = body(fun)

  if(length(b) == 1) {
     if(class(b) == "{")
        return(fun)
     body(fun) = setProvCall(b, op)
     return(fun)
  }

  for(i in 2:length(b)) {
    e = b[[ i ]]
    e = setProvCall(e, op, i == length(b))
    b[[ i ]] = e
  }

  if(addLoopCounters) {
       # need to add this to the call to the function.
      b[(2:length(b))+1]  =    b[(2:length(b))]
      b[[2]] = substitute(.loopCounter <- integer())
   }
  
  
  body(fun) = b
  fun
}

containsLoops =
function(fun, globals = findGlobals(fun, FALSE)$functions)
{
  any(c("for", "while") %in% globals)
}


setProvCall =
function(expr, op, last = FALSE, ...)
{
  UseMethod("setProvCall")
}

is.literal =
function(x)
  class(x) %in% c("character", "logical", "integer", "numeric")

setProvCall.default =
function(expr, op, last = FALSE, ...)
{
     # Can do this by pasting the class name and dispatching ourselves
     # but have to find the function.
     # R should do this.
    if(is(expr, "if"))
      setProvCall.if(expr, op, last, ...)
    else if(is(expr, "for"))
      setProvCall.for(expr, op, last, ...)
    else if(is(expr, "while"))
      setProvCall.while(expr, op, last, ...)
    else if(is(expr, "="))
      `setProvCall.=`(expr, op, last, ...)
    else if(is(expr, "{"))
      setProvCall.list(expr, op, last, ...)
    else if(is.literal(expr))
      setProvCall.literal(expr, op, last, ...)                
    else if(is(expr, "name"))
      setProvCall.name(expr, op, last, ...)
    else stop("no method yet for ", class(expr))
}

setProvCall.symbol = setProvCall.name =
function(expr, op, last = FALSE, ...)
{
  if(last)
    substitute(op(expr, sys.calls(), sys.frames(), sys.nframe()), list(expr = expr, op = op))
  else
    expr
}

setProvCall.call =
function(expr, op, last = FALSE, ...)
{
  isReturn = as.character(expr[[1]]) == "return"
  if(!isReturn && !last)
    return(expr)
  
  if(isReturn) {
     expr[[2]] = setProvCall.name(expr[[2]], op, TRUE, ...)
     expr
  } else
     setProvCall.name(expr, op, TRUE, ...)
}

setProvCall.if =
function(expr, op, last = FALSE, ...)
{
   expr[[3]] = setProvCall(expr[[3]], op, last, ...)
   if(length(expr) == 4)
      expr[[4]] = setProvCall(expr[[4]], op, last, ...)
   expr
}

setProvCall.for =
function(expr, op, last = FALSE, ...)
{
   expr[[4]] = setProvCall(expr[[4]], op, last, ...)
   expr
}

setProvCall.while =
function(expr, op, last = FALSE, ...)
{
   expr[[3]] = setProvCall(expr[[3]], op, last, ...)
   expr
}

`setProvCall.=` =
function(expr, op, last = FALSE, ...)
{
   if(!last)
      return(expr)
   expr[[3]] = setProvCall(expr[[3]], op, TRUE, ...)
}

setProvCall.literal =
function(expr, op, last = FALSE, ...)
{
  setProvCall.name(expr, op, last, ...)
}

setProvCall.list =
function(expr, op, last = FALSE, ...)
{
#  expr[] = lapply(expr, setProvCall, op, last, ...)
#  expr

 for( i in seq(along = expr)[-1]) {
    expr[[i]] = setProvCall(expr[[i]], op, i == length(expr), ...)
 }
 expr
}

addProvenance =
function(obj, calls, frames, nframe, ...)
{
  structure(obj, .provenanceInfo = list(timestamp =  Sys.time(),
                                        call = calls[[nframe]],
                                        calls = calls))
}
