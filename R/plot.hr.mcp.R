plot.hr.mcp <-
function(x,id=TRUE,axes=FALSE,add=FALSE,...){
  
  #Intuitive alias
  hr.mcp <- x
  
  args <- list(...)

  pts <- get.pts(hr.mcp$mcp)
  is.hole <- lapply(pts,function(lst)lst$hole)
  
  if(any(unlist(is.hole))){
    warning("Home range includes hole(s): option 'col' disabled")
    args$col <- NULL
  }

  if(!add){
    plot.new()
    
    if(is.null(args$xlim)){
      lim <- get.bbox(hr.mcp$mcp)
      args$xlim <- lim$x
    }
    
    if(is.null(args$ylim)){
      lim <- get.bbox(hr.mcp$mcp)
      args$ylim <- lim$y
    }
        
    plot.window(xlim=args$xlim,ylim=args$ylim,asp=1)
    if(axes){
      axis(side=1)
      axis(side=2)
      box()
    }
  }
  
  xy.lst <- get.pts(hr.mcp$mcp)
  xy.lst <- lapply(xy.lst,function(lst){
    polygon(lst$x,lst$y,...)
  })

  if(id)mtext(hr.mcp$id,line=1)
}