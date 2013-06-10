# Functions to query the provenance information.
# See sessionProv.R

getProvInfo =
function(obj)
{
  attr(obj, "provenanceInfo")
}

setProvInfo =
function(obj, info)
{
  attr(obj, "provenanceInfo") <- info
  obj
}



creator =
function(obj, info = getProvInfo(obj))
{
  info$user
}

pid =
function(obj, info = getProvInfo(obj))
{
  info$pid
}

rng =
function(obj, info = getProvInfo(obj))
{
  info[c("R.rngKind", "R.Random.seed")]
}

session =
function(obj, info = getProvInfo(obj))
{
   info$R.sessionInfo
}

sys =
function(obj, info = getProvInfo(obj))
{
   info$R.systemInfo
} 

when =
function(obj, info = getProvInfo(obj))
{
   info$when
} 

