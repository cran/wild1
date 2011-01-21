'gpc.to.Polygons' <-

function(x,ID=NA){

require(gpclib)

print("Requires package 'gpclib'")
print("'gpclib' is not free for commercial use'")

lst <- x@pts

Polygons(
  lapply(x@pts,function(poly){
    coords <- cbind(poly$x,poly$y)
    coords <- rbind(coords,coords[1,])
    hole <- poly$hole
    Polygon(coords,hole)
  }),
  ID=ID)
}
   