df.moco.child <- function(fn){
  source("extract.date.sub.R")
  df <- read.csv(file = fn, header=TRUE)
  date.sub.cond <- extract.date.sub(fn)
  df$Speed <- as.numeric(date.sub.cond[4])
  df$Block <- as.numeric(date.sub.cond[3])
  df$SubID <- factor(as.character(date.sub.cond[2]))
  return(df)
}