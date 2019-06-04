complete <- function(directory, id = 1:332) {
  
  files <- list.files(directory, full.names = TRUE)
  data <- data.frame()
  
  for (i in id) {
    nobs <- sum(complete.cases(read.csv(files[i])))
    data <- rbind(data, data.frame(i, nobs))
  }
  
  colnames(data) <- c("id", "nobs")
  data
  
}