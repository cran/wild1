hr.mcp <-
function(x,y=NULL,n.min=50,method=c("median","mean"),maxiter=1000,id=NA,
  domain=NA,exclude=0.00,clip.to=NA,plot=TRUE,...){

  if(exclude<0 | exclude>=1)stop("Exclude must be in [0,1)")
  
  
  method <- match.arg(method)
  if(!(method %in% c("median","mean")))stop("Method must be 'median' or 'mean'")

  #Convert "clip.to" to an object of class gpc.poly
  if(suppressWarnings(!is.na(clip.to))){
    require(gpclib)
  
    if(!any(inherits(clip.to,what=c("matrix","list","gpc.poly")))){
      stop("'clip.to' must be of class 'matrix','list', or 'gpc.poly'")
    }
  
    if(any(inherits(clip.to,what=c("matrix","list")))){
      clip.to <- as(clip.to, "gpc.poly")
    }
  }
  
  #Convert "domain" to an object of class gpc.poly
  if(suppressWarnings(!is.na(domain))){
    require(gpclib)
  
    if(!any(inherits(domain,what=c("matrix","list","gpc.poly")))){
      stop("'domain' must be of class 'matrix','list', or 'gpc.poly'")
    }
  
    if(any(inherits(domain,what=c("matrix","list")))){
      domain <- as(domain, "gpc.poly")
    }
  }
    
  if(is.null(y))xy <- x
  if(!is.null(y))xy <- cbind(x,y)
  
  if(inherits(x,what="data.frame"))xy <- as(xy,"matrix")
   
  xy <- na.omit(xy)
  xy.all <- xy 
  
  total <- nrow(xy)
  dropped <- 0
  excluded <- 0

  if(suppressWarnings(!is.na(domain))){
    point.x <- xy[,1]
    point.y <- xy[,2]
    
    pol.coords <- get.pts(domain)
    
    use <- lapply(pol.coords,function(lst){
      in.poly <- point.in.polygon(point.x,point.y,lst$x,lst$y)      
      in.poly <- in.poly != 0
      in.poly
    })
    
    use <- do.call(cbind,use) 
    
    is.hole <- lapply(pol.coords,function(lst){
      lst$hole
    })
    is.hole <- unlist(is.hole)
    use <- apply(use,1,function(use.)!any(use.[is.hole]) & any(use.[!is.hole]))
    xy <- xy[use,]
    dropped <- total-nrow(xy)
  }

#IF XY DOES NOT SUPPORT ESTIMATION, STOP HERE
  if(nrow(xy)<n.min){
    warning("Fewer than 'n.min' qualifying observations")
    return(NA)
  }

  if(nrow(xy)>=n.min){

    if(exclude>0 & method=="mean"){
      center <- apply(xy,2,mean)
    } 
  
    if(exclude>0 & method=="median"){
      #require(ICSNP)
      center <- spatial.median(xy,maxiter=maxiter)
    }
  
    foo <- function(a,b){
      sqrt(sum((a-b)^2))
      }
  
    if(exclude>0){
      d <- apply(xy,1,foo,b=center)
      cutoff <- quantile(d,1-exclude)
      excluded <- sum(d>cutoff)
      xy <- xy[d<=cutoff,]
    }
  
    used <- nrow(xy)
    mcp <- xy[chull(xy),]
    dimnames(mcp)<-list(NULL,c("x","y"))
    mcp <- as(mcp,"gpc.poly")
  
    if(suppressWarnings(!is.na(clip.to))){
      mcp <- intersect(mcp,clip.to)
    }
  
    if(plot){
      if(suppressWarnings(!is.na(clip.to) & is.na(domain))){
        plot(clip.to)                   
        plot(mcp,poly.args=list(lty=2),add=TRUE)
        points(xy.all,col=gray(0.80),pch=19,cex=0.5)
        points(xy,col="salmon",pch=19,cex=0.5)
        points(xy,cex=0.5)
      }
      if(suppressWarnings(is.na(clip.to) & !is.na(domain))){
        plot(domain)
        plot(mcp,poly.args=list(lty=2),add=TRUE)
        points(xy.all,col=gray(0.80),pch=19,cex=0.5)
        points(xy,col="salmon",pch=19,cex=0.5)
        points(xy,cex=0.5)
      }
      if(suppressWarnings(!is.na(clip.to) & !is.na(domain))){
        plot(clip.to,lwd=2)
        plot(domain,add=TRUE)
        plot(mcp,poly.args=list(lty=2),add=TRUE)
        points(xy.all,col=gray(0.80),pch=19,cex=0.5)
        points(xy,col="salmon",pch=19,cex=0.5)
        points(xy,cex=0.5)
      } 
      if(suppressWarnings(is.na(clip.to) & is.na(domain))){     
        plot(mcp,poly.args=list(lty=2))
        points(xy.all,col=gray(0.80),pch=19,cex=0.5)
        points(xy,col="salmon",pch=19,cex=0.5)
        points(xy,cex=0.5)
      }
    }
  
    mcp <- list(id=id,exclude=exclude,n=c(total=total,inadmissible=dropped,
      excluded=excluded,used=used),mcp=mcp,area=area.poly(mcp))
    class(mcp) <- c("list","hr.mcp")
    mcp
  }
}

