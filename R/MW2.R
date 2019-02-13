MW2 <- function (U, V) {
  TA <- table(U, V, useNA = "ifany")
  stevec <-(sum(TA[is.na(rownames(TA)) == FALSE, is.na(colnames(TA)) == FALSE]*(TA[is.na(rownames(TA)) == FALSE, is.na(colnames(TA)) == FALSE]-1))/2)
  imenovalec <- sum(TA*(TA-1))/2 + (sum(colSums(TA)**2) - sum(TA**2))/2
  return(stevec/imenovalec)
}
