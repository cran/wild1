'Polygons.to.gpc' <- 
function(x){

  require(gpclib)
  
  print("Requires package 'gpclib'")
  print("'gpclib' is not free for commercial use")  

  #For an object of class 'SpatialPolygonsDataFrame'
  if(any(inherits(x,what=c("SpatialPolygonsDataFrame","SpatialPolygons")))){
    x <- x@polygons[[1]]
  }

  #For an object of class 'Polygons'
  if(inherits(x,what=c("Polygons"))){
    polys.as.list <- lapply(x@Polygons,function(lst){
      list(x=lst@coords[,1],y=lst@coords[,2],hole=lst@hole)})
  }
    
  #For an object of class 'Polygon' 
  if(inherits(x,what=c("Polygon"))){
    polys.as.list <- list(x=x@coords[,1],y=x@coords[,2],hole=x@hole)
  }  
  new("gpc.poly",pts=polys.as.list)
}