consumptionRate <- function(MR, BM, P, AE, GE) {
  #if(is.na(AE)){AE <- 1}
  #if(is.na(GE)){GE <- 1}
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
   return(FM)
}
