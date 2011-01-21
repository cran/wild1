#Converts an object of class Polygons
#into a list of planar segment patterns
'Polygons.to.psp' <- 
function(Poly,window=NULL,...){
  P.coords <- lapply(Poly@Polygons,function(P){
    coords <- if(!P@hole)P@coords
    if(is.null(window)){
      win<-owin(range(coords[,1]),range(coords[,2]),...)
    }
    coords <- cbind(head(coords,-1),tail(coords,-1))
    dimnames(coords) <- list(NULL, c("x0","y0","x1","y1"))

    psp(coords[,1],coords[,2],coords[,3],coords[,4],win,...)
  })
  if(length(P.coords)==1){return(P.coords[[1]])}
  P.coords
}