MAW2 <- function (U = U, V = V, k = 1000){
  Empirical <- MW2(U = U, V = V)
  random <- lapply(1:k, function(x) MW2(U = sample(U), V = sample(V)))
  EV <- mean(unlist(random))
  return((Empirical - EV)/(1 - EV))
}
