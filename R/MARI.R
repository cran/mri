MARI <- function (U = U, V = V, k = 1000){
  Empirical <- MRI(U = U, V = V)
  random <- lapply(1:k, function(x) MRI(U = sample(U), V = sample(V)))
  EV <- mean(unlist(random))
  return((Empirical - EV)/(1 - EV))
}
