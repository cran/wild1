'Polygons.to.ppp' <- 
function(Poly,window=NULL,sample=FALSE,interval=NULL,...){
  P.coords <- lapply(Poly@Polygons,function(P){
  
   coords <- P@coords
   
   if(is.null(window)){
      win<-owin(range(coords[,1]),range(coords[,2]),...)
   }
  
   if(sample){
     if(is.null(interval)){interval<-1}
     #Polygon boundaries
     line <- Line(coords)
     n <- LineLength(line)/interval
     cds <- spsample(line,floor(n),"regular")
     coords <- cds@coords
   }
   
   coords <- unique(coords)
   
   ppp(x=coords[,1],y=coords[,2], window=win)
   })

  if(length(P.coords)==1){return(P.coords[[1]])}
  P.coords
}