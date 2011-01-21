trim.xy <-
function(x,y=NULL,exclude,center=c("median","mean"),maxiter=1000,plot=TRUE,...){

  if(exclude<0 | exclude>=1)stop("Exclude must be in [0,1)")
  
  center <- match.arg(center)
  if(!(center %in% c("median","mean")))stop("Method must be 'median' or 'mean'")
    
  if(is.null(y))xy <- x
  if(!is.null(y))xy <- cbind(x,y)
  
  if(inherits(x,what="data.frame"))xy <- as(xy,"matrix")
  
  xy <- cbind(1:nrow(xy),xy)
  
  dimnames(xy)<-list(NULL,c("index","x","y"))
  
  if(nrow(xy) > nrow(na.omit(xy)))warning("Missing values dropped")
   
  xy <- na.omit(xy)

  if(exclude>0 & center=="mean"){
    cntr <- apply(xy[,2:3],2,mean)
  } 
  
  if(exclude>0 & center=="median"){
    require(ICSNP)
    cntr <- spatial.median(xy[,2:3],maxiter=maxiter)
  }
  
  foo <- function(a,b){
    sqrt(sum((a-b)^2))
  }
  

  d <- apply(xy[,2:3],1,foo,b=cntr)
  cutoff <- quantile(d,1-exclude)
  xy <- cbind(xy,d)
  excluded <- xy[d>cutoff,]
  retained <- xy[d<=cutoff,]
  
  outer <- list(index=excluded[,c("index")], coords=excluded[,c("x","y")], d =excluded[,c("d")])
  inner <- list(index=retained[,c("index")], coords=retained[,c("x","y")], d =retained[,c("d")])
  
  xy.out <- list(method=center, center=cntr, inner=inner, outer=outer)
  
  #Pads upper y limit by 10 percent so axis doesn't hide points
  plot(xy[,2:3],pch=21,bg="green3",asp=1,ylim=range(xy[,3])+ diff(range(xy[,3]))*c(0,0.10))
  points(cntr["x"],cntr["y"],pch=24,bg="yellow",cex=2,lwd=1)
  points(xy.out$inner$coords,pch=21,bg="red")
  legend(x="top",legend=c("Innermost","Outermost","Center"),pch=c(21,21,24),pt.cex=c(1,1,1),bg="white",pt.bg=c("green3","red","yellow"),horiz=TRUE)

  xy.out
}