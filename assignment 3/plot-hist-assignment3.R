#Part 1 - plot the 30 day mortality rates for heart attack

outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character",header=TRUE)
outcome[, 11] <- as.numeric(outcome[, 11],na.rm=TRUE)

#histogram
hist(outcome[, 11],xlab= "Deaths", main = "Hospital 30-Day Death Mortality Rates from Heart Attack")
