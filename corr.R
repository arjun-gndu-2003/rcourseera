corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  ## NOTE: Do not round the result!
  id<-1:332
  path<-paste(directory,"/",sprintf("%03d",id),".csv",sep="")
  crr<-vector(mode="numeric",length = 0)
  
  for (i in 1:length(id))
  {
    
    temp<-read.csv(path[i])
    nobs=nrow(temp[complete.cases(temp),])
    if (nobs>threshold)
    {
      crr<-c(crr,cor(temp["sulfate"],temp["nitrate"],use="complete.obs"))
    }
  }    
  
  return(crr)
}