'n.risk' <- 

function(entry,exit,interval=1,...){

require(chron)

if(!identical(class(entry),class(exit))){
  stop("'entry' and 'exit' must be of identical class(es)")}
  
if(!inherits(entry,what=c("numeric","integer","chron"))){
  stop("'entry' and 'exit' must be numeric, integer, or of class 'chron'")}
  
if(!inherits(interval,what="numeric")){
  stop("'interval' must be numeric")}
  
if(length(entry) != length(exit)){
  stop("'entry' and 'exit' must be equal length vectors")}
  
if(any(is.na(c(entry,exit)))){
  stop("missing values not allowed")}
  
if(any(entry>=exit)){     
  stop("entry >= exit")}

#Intervals are open on the left,
#closed on the right, (left, right]
#Count applies to interval and not
#to endpoints
df <- na.omit(cbind(entry,exit))
lst <- apply(df,1,function(x){
  seq(from=x[1],to=x[2],by=interval)
  }
)

n.risk <- data.frame(table(do.call(c,lst)))
names(n.risk) <- c("t","n")
n.risk$t <- as.numeric(as.character(n.risk$t))
n.risk$n <- as.numeric(as.character(n.risk$n))

plot(n.risk,type="s",...)

n.risk

}