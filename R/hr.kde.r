#Get home range contour; levels specified so terminology 
#follows custom for analysis of wildlife data, i.e.,
#95% contour expected to include 95% of observations.

'hr.kde' <-
  function(x,level,plot=TRUE,add=FALSE,...){
  
  #NO NEED TO BE ABLE TO HANDLE MULTIPLE CONTOURS,
  #WHICH CAN BECOME COMPLICATED IN THE PRESENCE OF
  #HOLES; USE LAPPLY
  
  #NOT SURE IF THIS COULD RETURN AN INCOMPLETE POLYGON:
  #HAVE NOT SEEN IT HAPPEN YET...
  
  if(!inherits(x,what=c("kde"))){
    stop("'x' not of class 'kde'")
  }
  
  hr <- x

  #Data
  x <- hr$eval.points[[1]]
  y <- hr$eval.points[[2]]
  z <- hr$estimate
  
  lev <- contourLevels(hr,1-level)
  
  cl <- contourLines(x=x,y=y,z=z,levels=lev)  
  
  #Contours represented by matrices
  xy <- lapply(cl,function(x) {
    cbind(x$x,x$y)
    })  

  #Each contour represented by a "Polygon" (maptools)
    #Names of contours
  xy <- lapply(xy,Polygon)
  
  #Contours represented by a "Polygons" object (maptools)
  lbl <- 100*level
  id <- paste(lbl,"%",sep="")
  xy <- Polygons(xy,ID=id)
  gpclibPermit()
  xy <- checkPolygonsHoles(xy)
    
xy
}


  

