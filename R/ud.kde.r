'ud.kde' <-
function(x,y=NULL,H=NULL,n.min=50,...){
  
  #Check x
  if(!any(inherits(x,what=c("matrix","numeric","integer","data.frame")))){
    stop("'x' must be a numeric or integer vector, a matrix, or a data frame")
  }

  #If x is a data frame, convert to a matrix
  if(inherits(x,what="data.frame"))xy <- as(x,"matrix")
  
  #If x is a vector, y must match
  if(inherits(x,what=c("numeric","integer")) & class(x) != class(y)){
    stop("'x' and 'y' not of the same class")
  }
  
  #If y exists, x and y must be vectors; combine in matrix
  if(!is.null(y))xy <- cbind(x,y)
  
  #if x is a matrix, rename
  if(inherits(x,what="matrix"))xy <- x
  
  #Missing values allowed but dropped and trigger a warning 
  xy. <- xy
  xy <- na.omit(xy)
  if(nrow(xy.)!=nrow(xy))warning("Missing values dropped")
  
  if(!inherits(n.min,what=c("numeric","integer"))){
    stop("'n.min' must be numeric")
    n.min <- floor(n.min)
  }

#IF XY DOES NOT SUPPORT ESTIMATION, STOP HERE
  if(nrow(xy)<n.min){
    warning("Fewer than 'n.min' qualifying observations")
    return()
  }

  if(nrow(xy)>=n.min){
  
    require(ks)
    
    #Default bandwidth
    if(is.null(H)){
      H <- Hscv(x=na.omit(xy))
    }
      
    fhat <- kde(x=xy,H=H,...)
        
    return(fhat)
  }
}