csm <- 
function (entry, exit, event, fate, cause, alpha = 0.1) 
{

#An adaptation of S-Plus code published by
#Heisey and Patterson (2006).

#Some differences from previous implementations:
#  1) Will accommodate a wide range of input
#     classes (most that are likely to be
#     encountered).
#  2) Does not require input to be combined
#     in a single object, or specific names
#     for input vectors.
#  3) Computes confidence limits for any
#     specified value of alpha and labels
#     results accordingly. 
#  4) Includes numerous checks for foreseeable 
#     input errors.
#  5) Output of a new class, 'csm' The 
#     package includes a generic plotting
#     function for this class.
#  6) Patterson provided an adaptation by
#     Guillaume Chapron.  Chapron's adaptation
#     returns some numeric results as character 
#     vectors.
#  7) Chapron's adaptation did not correctly 
#     reproduce all of the results published 
#     by Heisey and Patterson


#  Note that results will differ from those
#  in Table 3 of Heisey and Patterson (2006)
#  because alpha levels in Table 3 are incorrect.
#  Table 3 presents 90% confidence intervals,
#  not the 95% intervals suggested by column
#  headings. 
        
#Quantile of standard normal
#corresponding with 100*(1-alpha)%
#confidence interval; used to 
#compute confidence limits and
#label columns
z <- qnorm(1-alpha/2)

#Labels for confidence limits       
siglevl <- as.character(100*(1-alpha))
lcl.label <- paste("lcl",siglevl,sep=".")  
ucl.label <- paste("ucl",siglevl,sep=".")  
          
#Data vectors of same length?
data.lst <- list(entry,exit,event,fate)
len <- lapply(data.lst,length)
if(length(unique(len))>1)stop(
  "Data vectors not of equal length")
  
#Entry and exit may be numeric vectors
#or date/time objects of class 'chron'
cl.entry <- inherits(entry,what=c("chron","integer","numeric")) 
cl.exit <- inherits(exit,what=c("chron","integer","numeric"))
  
if(!cl.entry | !cl.exit){ 
  stop("'entry' and 'exit' must be of class 'numeric', 'integer', or 'chron'")
  }
  
if(class(entry) != class(exit)){
  stop("'entry' and 'exit' not of same class")
  }
  
#Fate may be numeric, character, or factor
cl.fate <- inherits(fate,what=c("numeric","integer","character","factor"))
if(!cl.fate){
  stop("'fate' must be of class 'numeric', 'integer', 'character', or 'factor'")
  }
    
#Issue warning if cause includes values not
#found in fate

if(!all(cause %in% fate)){
  warning("'cause' includes values not found in 'fate'")
  }
  
#Event may be numeric, integer (0 = no event, 1=event)
#or logical (TRUE = event)
if(!inherits(event,what=c("numeric","integer","logical"))){
  stop("'event' must be of class 'numeric', 'integer', or 'logical'")
  }
  
#If event is numeric or integer, only values 0 and 1 are allowed
cl.event <- class(event)
if(cl.event=="numeric" | cl.event=="integer"){
  if(!(all(sort(unique(event))==c(0,1)))){
    stop("'event' is of class 'numeric' or 'integer'; values must be 0 or 1")
    }
  }
  
#Provides classes and methods for dates
#and times if 'entry' and 'exit' are of
#class 'chron'
any.chron <- any(unlist(lapply(data.lst,class))=="chron")
if(any.chron)require(chron)
      
#Compile data in a frame
table <- data.frame(entry, exit, event, fate)
names(table) <- c("entry", "exit", "event", "fate")

#Generalized Kaplan-Meier estiamtes of mortality for all events
#and for events in 'cause'
temp.all <- summary(survfit(Surv(entry, exit, event) ~ 1, 
        data = table))
temp.s <- summary(survfit(Surv(entry, exit, fate %in% cause) ~ 
        1, data = table))
        
#Combine estimates in a data frame
s.df <- data.frame(time = temp.s$time, n.event = temp.s$n.event, 
        n.risk = temp.s$n.risk, survival = temp.s$surv)

all.df <- data.frame(time = temp.all$time, n.event = temp.all$n.event, 
        n.risk = temp.all$n.risk, survival = temp.all$surv)

all.s.df <- merge(all.df, s.df, by.x = "time", by.y = "time", 
        all.x = TRUE, suffixes = c(".all", ".s"))

#Number of event times    
x <- nrow(all.s.df)
 
#Vector to store mortality rates  
mort.rate <- numeric(x)

#Vector to store CIF
CIF <- numeric(x)

#Can't remember what this does; delete?
#lst <- vector(mode = "list", length = x)

t <- 1
    
    while (t <= x) {
        mort.rate[1] <- all.s.df$n.event.s[1]/all.s.df$n.risk.s[1]
        if (t > 1) {
            mort.rate[t] <- (all.s.df$survival.all[t - 1] * 
              all.s.df$n.event.s[t])/all.s.df$n.risk.s[t]
        }
        ifelse(is.na(mort.rate[t]), CIF[t] <- NA, CIF[t] <- sum(mort.rate[1:t], 
            na.rm = TRUE))
        t = t + 1
    }
    MORT <- data.frame(mort.rate = mort.rate)
    CIF2 <- data.frame(CIF = CIF)
    CIF.s.all <- cbind(all.s.df, MORT, CIF2)
    #CIF.s.all$cumvar.p1 <- NA    #Turn this on to add to output
    #CIF.s.all$cumvar.p2 <- NA    #Turn this on to add to output
    #CIF.s.all$cumvar.p3 <- NA    #Turn this on to add to output
                                  #Also turn on related lines below
    SE <- numeric(x)
    totvar.t <- numeric(x)
    t <- 1
    j <- 1
    Ij <- 0
    cumvar.p1 <- 0
    cumvar.p2 <- 0
    cumvar.p3 <- 0
    while (t <= x) {
        It <- CIF.s.all$CIF[t]
        if (is.na(It)) {
            #CIF.s.all$cumvar.p1[t] <- NA     #Turn this on to add to output
            #CIF.s.all$cumvar.p2[t] <- NA     #Turn this on to add to output
            #CIF.s.all$cumvar.p3[t] <- NA     #Turn this on to add to output
            CIF.s.all$cumvar[t] <- NA
            CIF.s.all$SE[t] <- NA
            CIF.s.all[t,lcl.label] <- NA
            CIF.s.all[t,ucl.label] <- NA
            t = t + 1
        }
        if (!is.na(It)) {
            while (j < t) {
                if (is.na(CIF.s.all$CIF[j])) {
                  Ij <- Ij
                }
                if (!is.na(CIF.s.all$CIF[j])) {
                  Ij <- CIF.s.all$CIF[j]
                }
                cumvar.p1 <- cumvar.p1 + (It - Ij)^2 * 
                  (CIF.s.all$n.event.all[j]/(CIF.s.all$n.risk.all[j] * 
                  (CIF.s.all$n.risk.all[j] - CIF.s.all$n.event.all[j])))
                if (!is.na(CIF.s.all$CIF[j])) {
                  if (j == 1) {
                    Sj3 <- 1
                  }
                  if (j != 1) {
                    Sj3 <- CIF.s.all$survival.all[j - 1]
                  }
                  Ijc <- CIF.s.all$CIF[j]
                  cumvar.p3 <- cumvar.p3 + (It - Ijc) * (Sj3) * 
                    (CIF.s.all$n.event.all[j]/(CIF.s.all$n.risk.all[j])^2)
                }
                j <- j + 1
            }
            ifelse(t == 1, Sj2 <- 1, Sj2 <- CIF.s.all$survival.all[t - 
                1])
            cumvar.p2 <- (Sj2)^2 * (((CIF.s.all$n.event.all[t]) * 
                (CIF.s.all$n.risk.all[t] - CIF.s.all$n.event.all[t]))/
                (CIF.s.all$n.risk.all[t])^3) + cumvar.p2
                
            #CIF.s.all$cumvar.p1[t] <- cumvar.p1   #Turn this on to add to output
            #CIF.s.all$cumvar.p2[t] <- cumvar.p2   #Turn this on to add to output
            #CIF.s.all$cumvar.p3[t] <- cumvar.p3   #Turn this on to add to output
            
            totvar.t[t] <- cumvar.p1 + cumvar.p2 - (2 * cumvar.p3)
            CIF.s.all$cumvar[t] <- totvar.t[t]
            SE[t] <- sqrt(totvar.t[t])
            CIF.s.all$SE[t] <- SE[t]
            CIF.s.all[t,lcl.label] <- CIF.s.all$CIF[t] - (z * SE[t])
            CIF.s.all[t,ucl.label] <- CIF.s.all$CIF[t] + (z * SE[t])

            t = t + 1
            j <- 1
        }
        cumvar.p1 <- 0
        cumvar.p3 <- 0
        Ij <- 0
        It <- 0
    }
    class(CIF.s.all) <- c("csm", "data.frame")
    return(CIF.s.all)
}

