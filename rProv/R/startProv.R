startProv =
  #
  # Start collecting top-level task information
  #
function(cb = provCallback())
{
  id = addTaskCallback(if(is.function(cb)) cb else cb$handler)
  attr(cb, "taskCallbackID") = id
  cb
}


provCallback =
  #
  # Create the callback for addTaskCallback() along with accessor and control functions
  # Uses lexical scoping to collect and manage the list of tasks.
function()
{
  tasks = list()
  suspended = FALSE
  
  handler = function(expr, value, ok, visible) {
    if(suspended)
      return(TRUE)
    
    tasks[[ length(tasks) + 1L ]] <<-
         Task(expr, value, ok, visible)
    
    TRUE
  }
  
structure(
  list(handler = handler,
       tasks = function(omitProvenance = TRUE) {
                 if(omitProvenance) 
                   filterTasks(tasks, "ProvenanceTask")
                 else
                    tasks
                },
       pause = function() { suspended <<- TRUE
                            invisible(new("ProvenanceTask"))
                          },
       resume = function() { suspended <<- FALSE
                             invisible(new("ProvenanceTask"))
                           },       
       reset = function() { tasks <<- list()
                            invisible(new("ProvenanceTask"))
                          }),
    class = "BasicProvenanceTaskHandlers")
}

filterTasks =
function(taskList, className)
{
   taskList[ ! sapply(taskList, inherits, className) ]
}



