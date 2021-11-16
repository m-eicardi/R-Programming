##Part 2 - find the best hospital in a state

best <- function(state, outcome) {
   
    data <- read.csv("outcome-of-care-measures.csv", colClasses = "character", header=TRUE)
    
    df <- as.data.frame(cbind(data[, 2], data[, 7], data[, 11], data[, 17], data[, 23]),
    stringsAsFactors = FALSE)
    
    colnames(df) <- c("hospital", "state", "heart attack", "heart failure", "pneumonia")
        
    
    if(!state %in% df[, "state"]){
        stop('invalid state')
        
    } else
        
        if(!outcome %in% c("heart attack", "heart failure", "pneumonia")){
        stop('invalid outcome')
            
    } else {
        si <- which(df[, "state"] == state)
        ts <- df[si, ]    # extracting data for the called state
        oi <- as.numeric(ts[, eval(outcome)])
        min_val <- min(oi, na.rm = TRUE)
        result  <- ts[, "hospital"][which(oi == min_val)]
        output  <- result[order(result)]
    }
        
    return(output)
    
    }