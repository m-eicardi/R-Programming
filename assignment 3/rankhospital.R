##Part 3 - ranking hospitals by outcome in a state

rankhospital <- function(state, outcome, num = "best"){
   
    data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    
    df <- as.data.frame(cbind(data[, 2], data[, 7], data[, 11], data[, 17], data[, 23]),
    stringsAsFactors = FALSE)
    
    colnames(df) <- c("hospital", "state", "heart attack", "heart failure", "pneumonia")
    
    if (!state %in% df[, "state"]){
        stop('invalid state')
        
    } else if (!outcome %in% c("heart attack", "heart failure", "pneumonia")){
        stop('invalid outcome')
        
    } else if (is.numeric(rank)){
        
        si <- which(df[, "state"] == state)
        ts <- df[si, ]  
        ts[, eval(outcome)] <- as.numeric(ts[, eval(outcome)])
        ts <- ts[order(ts[, eval(outcome)], ts[, "hospital"]), ]
        output <- ts[, "hospital"][num]
        
    } else if (!is.numeric(num)){
        
        if (num == "best") {
            output <- best(state, outcome)
            
    } else if (num == "worst") {
            
            si <- which(fd[, "state"] == state)
            ts <- fd[si, ]    
            ts[, eval(outcome)] <- as.numeric(ts[, eval(outcome)])
            ts <- ts[order(ts[, eval(outcome)], ts[, "hospital"], decreasing = TRUE), ]
            output <- ts[, "hospital"][1]
            
        } else {
            
            stop('invalid rank')
        }
    }
            
        return(output)
}
