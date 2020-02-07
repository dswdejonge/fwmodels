consumptionRate <- function(MR, BM, P, AE, GE) {
  F <- (MR * BM + P) / (AE * GE)
  return(F)
}

topDownBalancing <- function(PM, MR, BM, AE, GE){
  FM <- PM
  finished <- numeric()
  N <- which(rowSums(PM) == 0)
  while(length(N) > 0) {
    for(n in N) {
      Q <- consumptionRate(MR[n], BM[n], sum(FM[n,], na.rm = T), AE[n], GE[n])
      FM[,n] <- PM[,n]*BM / sum(PM[,n]*BM) * Q
    }
    finished <- c(finished, N)
    left <- PM[,-finished]
    if(is.null(dim(left))) {break}
    N <- which(rowSums(left) == 0)
    N <- N[!N %in% finished]
  }
  # Set all NA, NaN, and NULL values to 0
  FM[which(is.na(FM)|is.nan(FM)|is.null(FM))] <- 0
  return(FM)
}

# detritus production is excretion and mortality
detritusFeedback <- function(FM, AE, MR, BM){
  excretion <- (1-AE)*colSums(FM)
  mortality <- MR*BM
  to_detritus <- matrix(c(excretion, mortality), nrow = length(excretion), ncol = 2)
  to_detritus[which(is.na(to_detritus))] <- 0
  colnames(to_detritus) <- c("excretion", "mortality")
  return(to_detritus)
}
