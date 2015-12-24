pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  ## NOTE: Do not round the result!
  
  path<-paste(directory,"/",sprintf("%03d",id),".csv",sep="")
  full_data=data.frame()
  
  
  for (i in 1:length(id))
  {
    ##print(path[i])
    temp<-read.csv(path[i])
    full_data<-rbind(full_data,temp)
  }    
  ##print(dim(full_data))
  
  mean_value<-mean(full_data[complete.cases(full_data[pollutant]),pollutant])
  return(mean_value)
}