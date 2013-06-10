#
# These functions are related to recovering the information
# about how to recreate an object.  We use the provenance
# information

getCommands =
  #
  #  From the current object obj, find the objects on which it depends
  #  by traversing the provenance information it contains and the information
  #  in these other objects.
  #
function(obj,  info = getProvInfo(obj), recursive = TRUE, name = deparse(substitute(obj)))
{
  inputs = getInputs(parse(text = info$command))
  vars = inputs@inputs
  ans = list()
  ans[[name]] = parse(text = info$command)
  while(length(vars)) {
      v = vars[1]
      vars = vars[-1]
      val = get(v)
      cmd <- ans[[v]] <- parse(text = getProvInfo(val)$command)
      inputs = getInputs(cmd)
      vars <- c(vars, inputs@inputs) 
  }
  rev(ans)
}

