anchors <- structure(function()#anchor index
### retrieve a copy of the anchor index used by kfigr. The anchor index cannot 
### be modified by the user, but are able to view it for code verification and 
### troubleshooting.
{
  types <- get('types', envir=anchorenv)
  formathist <- function(x){
    if(length(x) > 0)
      setNames(do.call(rbind.data.frame, x),
               c('label', 'type', 'number', 'called.by'))
    else
      x
  }
  structure(setNames(lapply(types, function(x) get(x, envir=anchorenv)), types), 
	index = get('index', envir=anchorenv),
	history = formathist(get("history", envir=anchorenv))
  )
### a list  of lists, with attributes \code{index} (a lookup table) and 
### \code{history} (indexing sequence). The parent list contains a list 
### for each defined figr type, each of which contain figr labels in the 
### order that they were anchored.
}, ex = function(){
  figr("foo", type="figure")
  figr("bar", type="table")
  figr("test", type="figure")
  anchors()
})
