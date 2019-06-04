corr <- function(directory, threshold = 0) {
  files <- list.files(directory, full.names = TRUE)
  data <- vector(mode = "numeric", length = 0)
  
  for (i in 1:length(files)) {
    
    csv <- read.csv(files[i])
    csum <- sum((!is.na(csv$sulfate)) & (!is.na(csv$nitrate)))
    
    if (csum > threshold) {
      tmp <- csv[which(!is.na(csv$sulfate)), ]
      csv2 <- tmp[which(!is.na(tmp$nitrate)), ]
      data <- c(data, cor(csv2$sulfate, csv2$nitrate))
    }
    
  }
  
  data
  
}