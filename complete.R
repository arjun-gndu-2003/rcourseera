complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  
  path<-paste(directory,"/",sprintf("%03d",id),".csv",sep="")
  
  full_data=data.frame()
  
  for (i in 1:length(id))
  {
  
    temp<-read.csv(path[i])
    full_data<-rbind(full_data,data.frame(id=id[i],nobs=nrow(temp[complete.cases(temp),])))
  }    
  
  return(full_data)
}