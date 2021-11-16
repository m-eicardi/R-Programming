corr <- function(directory, threshold = 0) {
    
    mdata <-list.files(directory, full.names = TRUE)
    mdata_qt <- length(mdata)
    
    
    cors <- as.numeric()
    dat <- data.frame()
    
    #loop
    for (m in 1:mdata_qt) {
        
        dat <- read.csv(mdata[m])
        
        if(sum(complete.cases(dat)) > threshold) {
            
            cors <- rbind(cors, cor(dat[,2], dat[,3], use = "na.or.complete"))
        }
    }
    
    as.vector(cors)
}