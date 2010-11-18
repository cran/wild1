'plot.csm' <-

function(x,firstx=0,lastx=365,alpha=0.10,add=FALSE,ylim=NULL,axes=TRUE,
  href=TRUE,xlab="t",ylab="S(t)",lty=1,lty.ref="88",lty.ci=2,lwd=1,
  lwd.ref=1,lwd.ci=1,cex.lab=1,cex.axis=1,col.ref="gray60",col.ci="black",
  marks=NULL,cex.marks=1,...){
    
  #x must be an object of class csm
  #Intuitive alias 
  csm <- x 

  if(!inherits(csm,what="csm"))stop("'csm' must be an object of class csm")
  
  if(!is.null(alpha)){
    if(alpha<=0 | alpha>=1){
      stop("'alpha' must be null or in (0,1)")
    }
  }
  
  
  #No confidence limits if alpha is NULL
  do.ci <- !is.null(alpha)
     
  if(do.ci){
    z <- qnorm(1-alpha/2)
  }
    
  xlim=c(firstx,lastx)
  
  df <- na.omit(csm)

  x <- df$time
  y <- 1-df$CIF
  
  if(do.ci){
    uy <- y+z*df$SE
    ly <- y-z*df$SE
  }
  
  x <- c(firstx,x,lastx)
  len <- length(y)
  
  if(do.ci){
    uy <- c(1,uy,uy[len])
    ly <- c(1,ly,ly[len])
  }
  
  y <- c(1,y,y[len])
  
  if(do.ci){
    uy[uy>1] <- 1
    ly[ly>1] <- 1
  }

  if(is.null(ylim) & do.ci){
    ylim=range(c(y,uy,ly))
  }
  
  if(is.null(ylim) & !do.ci){
    ylim <- range(y)
  }

  if(!add){
    plot.new()
    plot.window(xlim=xlim,ylim=ylim)
  }

  if(href)abline(h=min(y),lty=lty.ref,col=col.ref,lwd=lwd.ref)

  lines(x,y,type="s",lwd=lwd,lty=lty)
  
  if(do.ci){
    lines(x,uy,type="s",lty=lty.ci,lwd=lwd.ci,col=col.ci)
    lines(x,ly,type="s",lty=lty.ci,lwd=lwd.ci,col=col.ci)
  }
  
  if(!is.null(marks)){
    bin <- cut(marks,x,label=head(y,-1))
    bin <- as.numeric(as.character(bin))
    marks.df <- data.frame(marks,bin)
    
  }
      
  box(lwd=lwd)

  if(axes){
    axis(side=1,cex.axis=cex.axis)
    axis(side=2,cex.axis=cex.axis)
  }
  
  mtext(xlab,side=1,line=3,cex=cex.lab)
  mtext(ylab,side=2,line=3,cex=cex.lab)
}

