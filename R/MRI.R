MRI <- function (U, V){
  TA <- table(U, V, useNA = "ifany")
  m <- sum(TA[is.na(rownames(TA)) == FALSE, is.na(colnames(TA)) == FALSE])
  rez <- (choose(m, 2) + sum(TA[is.na(rownames(TA)) == FALSE, is.na(colnames(TA)) == FALSE]^2) - 1/2 * (sum(rowSums(TA[is.na(rownames(TA)) == FALSE, is.na(colnames(TA)) == FALSE])^2) + sum(colSums(TA[is.na(rownames(TA)) == FALSE, is.na(colnames(TA)) == FALSE])^2)))/choose(sum(TA), 2)
  return(rez)
}
