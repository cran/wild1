#Returns TRUE if point is not strictly
#exterior to all polygons in hr

'point.in.Polygons' <- 
function(x,y=NULL,Poly,output=c("points","logical","matrix"),...){

  output <- match.arg(output)
  if(!(output %in% c("points","logical","matrix")))stop("'output' must be 'points','logical,' or 'matrix,'")

  #x may be a matrix
  if(is.null(y))xy <- x
  
  #or x may be a vector; then y is also
  if(!is.null(y))xy <- cbind(x,y)
  
  #or x may be a data frame
  if(inherits(x,what="data.frame"))xy <- as(xy,"matrix")
  
  if(nrow(xy) > nrow(na.omit(xy)))warning("Missing values dropped")
   
  xy <- na.omit(xy)
  
  require(sp)

  in.lst <- lapply(Poly@Polygons,function(P){
    coords <- P@coords
    point.in.polygon(xy[,1],xy[,2],coords[,1],coords[,2],...)
  })
  
  in. <- do.call(cbind,in.lst)
  
  in. <- apply(in.,1,which)  #Testing this; should return 
                             #Polygon number rather than matrix now
  
  lgcl <- apply(in.,1,function(i)any(i>=1))
  
  if(output=="matrix") return(in.)
  if(output=="logical") return(lgcl)
  if(output=="points") return(xy[lgcl,])
}