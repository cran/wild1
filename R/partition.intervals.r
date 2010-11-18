'partition.intervals' <- 

  function(first,last,breaks,recurrent=TRUE,labels=NULL,id=NULL,event=NULL,no.event=NULL)

{ 

  #'first,' 'last,' and 'id' (if supplied) must be
  #of equal length
  if(
    (!is.null(id) & (length(id)!=length(first))) |
    (length(first)!=length(last))){
   stop("'id,''first,' and 'last' not of equal length")
  }

  if(!is.null(event) & is.null(no.event)){
    stop("Must supply a value for 'no.event'")}
    
  if(!is.null(no.event)){
    if(length(no.event)>1){
      stop("Length of 'no.event' exceeds 1")
    }
  }

  cl.first <- class(first)
  if(!inherits(breaks,what=cl.first) | !inherits(last,what=cl.first)){
    stop("Use same class for 'first', 'last', and 'breaks'")}

  if(!is.logical(recurrent)){
    stop("'recurrent' must be TRUE or FALSE")}

  #If 'id' not supplied, create one
  if(is.null(id)) id <- 1:length(first)
    
  #If 'labels' not supplied, create labels 
  if(is.null(labels)) labels <- 1:(length(breaks)-1)
  
  #Object to store output
  output <- vector(mode="list",length=length(first))
  names(output) <- id
  
  #Put input in a data frame
  df <- data.frame(id,first,last)
  
  for(i in 1:length(first)){
     bks <- c(first[i],breaks[breaks>=first[i] & breaks<last[i]],last[i])
     
     if(length(bks)==2){
       output[[i]] <- data.frame(first=bks[1],last=bks[2])
     } 
     
     if(length(bks)>2){
       output[[i]] <- data.frame(first=head(bks,-1),last=tail(bks,-1))
     }
     
     if(!is.null(event)){
       output[[i]]$event <- no.event
       last.event <- nrow(output[[i]])
       output[[i]]$event[last.event] <- event[i]
     }
     
     output
  }   
  output <- do.call(rbind,output)

  if(recurrent){
    interval <- findInterval(output$first,breaks)
    output$first <- output$first-breaks[interval]
    output$last <- output$last-breaks[interval]
  }
  output 
}



