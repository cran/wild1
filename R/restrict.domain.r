'restrict.domain' <- 
function(x,y=NULL,domain,plot=TRUE,add=FALSE,col.in="salmon",col.out="gray",...){

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
  
  #If x is a matrix, rename
  if(inherits(x,what="matrix"))xy <- x
  
  #Attach record number
  xy <- cbind(1:nrow(xy),xy)
  dimnames(xy)<- list(NULL,c("index","x","y"))
  
  #Missing values allowed but dropped and trigger a warning 
  xy. <- xy
  xy <- na.omit(xy)
  if(nrow(xy.)!=nrow(xy))warning("Missing values dropped")


  #"domain" may be a matrix, a Polygon, an object of class "Polygons", etc., but may not contain "holes" 
  if(!any(inherits(domain,what=c("matrix","Polygon","Polygons","SpatialPolygonsDataFrame","gpc.poly")))){
    stop("'domain' must be of class 'matrix,' 'Polygon,' 'Polygons,' 'SpatialPolygonsDataFrame', or 'gpc.poly'")
  } 
  
  if(inherits(domain,what="matrix")){
    domain <- Polygon(domain,hole=FALSE)
  }
  
  if(inherits(domain,what="Polygon")){
    domain <- Polygons(list(domain),ID=NA)
  }
  
  #Will take an object of this class, but it should contain
  #just one object of class SpatialPolygonsDataFrame
  if(inherits(domain,what="SpatialPolygonsDataFrame")){
    domain <- domain@polygons[[1]]
  }
  
  #Will take an object of class 'gpc.poly'
  if(inherits(domain,what="gpc.poly")){
    domain <- lapply(domain@pts,function(lst){
      x <- c(lst$x,lst$x[1])
      y <- c(lst$y,lst$y[1])
      Polygon(cbind(x,y),hole=lst$hole)
    })
    domain <- Polygons(domain,ID=NA)  
  }
  
  if(!inherits(domain,what="Polygons")){
    stop("Conversion of 'domain' to class 'Polygons' failed")
  }
  
  if(any(unlist(lapply(domain@Polygons,function(lst)lst@hole)))){
      warning("Domain includes one or more holes!")}
  
  #Copy of the data
  xy.all <- xy 
  
  #Sample size (non-missing)
  total <- nrow(xy)
  inadmissible <- 0
  
  point.x <- xy[,2]
  point.y <- xy[,3]
    
  use <- lapply(domain@Polygons,function(lst){
    coords <- lst@coords
    x <- coords[,1]
    y <- coords[,2]
    in.poly <- point.in.polygon(point.x,point.y,x,y)      
    admissible <- in.poly != 0
    admissible
  })                           
    
  use <- do.call(cbind,use) 
  
  use <- apply(use,1,any)
  
  admit.index <- xy[use,1]
  admit.coords <- xy[use,2:3]
  exclude.index <- xy[!use,1]
  exclude.coords <- xy[!use,2:3]
  
  admit <- list(index=admit.index,coords=admit.coords)
  exclude <- list(index=exclude.index,coords=exclude.coords)
  
  foo.exclude <- function(...,bg){
        points(exclude$coords,pch=21,bg=col.out,...)
  }
  foo.admit <- function(...,bg){
        points(admit$coords,pch=21,bg=col.in,...)
  }

  if(plot){
    if(add==FALSE){plot(domain,...)}
    foo.exclude(...)
    foo.admit(...)
  }
  xy.out <- list(inside=admit,outside=exclude)
  xy.out
}  