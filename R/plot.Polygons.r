#'x' currently an object of class 'Polygons'
#'fg' specifies plotting color for foreground ("islands")
#'bg' specifies plotting color for background ("holes")

'plot.Polygons' <- 

function(x,...,fg=NULL,bg=NULL,add=FALSE){
  
  if(!add){
    plot.new()
    bb <- bbox(x)
    plot.window(bb[1,],bb[2,],asp=1)
  }
  
  local.poly <- function(...,add.,col){
     polygon(x@coords,col=fg,...)
  }
  
  local.bg <- function(...,col){
     polygon(polygon(x@Polygons[[i]]@coords,col=bg,...))
  }

  local.fg <- function(...,col){
     polygon(polygon(x@Polygons[[i]]@coords,col=fg,...))
  }

  #if(inherits(x,what="Polygon")){
  #  local.poly(...)
  #} 

  if(inherits(x,what="Polygons")){
  
    for(i in x@plotOrder){
      if(x@Polygons[[i]]@hole){
        local.bg(...)
      }
      else{
        local.fg(...)
      }    
    }
  }
}
  