#Given an object of class Polygons, returns
#a similar object with no holes
'remove.holes' <- 
function(Poly){
    require(sp)
    is.hole <- lapply(Poly@Polygons,function(P)P@hole)
    is.hole <- unlist(is.hole)
    polys <- Poly@Polygons[!is.hole]
    Poly <- Polygons(polys,ID=Poly@ID)
    Poly
}