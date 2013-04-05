getSessionProvInfo <-
function(code = character(), ..., .meta = list(...))
{  
  if(length(code)) 
    .meta[["command"]] = paste(deparse(code), collapse = "\n")


  .meta[["when"]] = as.character(Sys.time())
  .meta[["pid"]] = as.character(Sys.getpid())
  .meta[["R.sessionInfo"]] = png:::serializeBase64(sessionInfo())
  .meta[["R.rngKind"]] = png:::serializeBase64(RNGkind())
  if(exists(".Random.seed", globalenv()))
     .meta[["R.Random.seed"]] =  png:::serializeBase64(get(".Random.seed", globalenv()))

  .meta
}
  
