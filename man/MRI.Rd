\name{MRI}
\alias{MRI}
\alias{MARI}
\title{
Modified Adjusted Rand Index
}
\description{
They are used to compute the value of the Modified Rand Index and the Modified Adjusted Rand Index. They consider two partitions which are usually obtained on two sets of units where the intercept is non-empty or where one set of units is a subset of another set of units.

Because two vectors U and V (partitions) do not have the same length, the cluster of units, which are not present in the partition V (outgoers), need to be added to the partition V (denoted as V') and/or the cluster of units, which are not present in the partition U (newcomers), need to be added to the partition U (denoted as U'). The added values have to be \code{NA}.
}
\usage{
MRI(U, V)
MARI(U, V, k)
}
\arguments{
  \item{U}{partition U or U'}
  \item{V}{partition V or V'}
  \item{k}{the number of iterations to estimate the expected value of the index in the case of two random and independent partitions}
}
\value{
The functions return the value of the Modified Rand Index or the value of the Modified Adjusted Rand Index. The expected value of the (Modified) Adjusted Rand Index is 0 in the case of two random and independent partitions. The maximum value of the index is 1. Higher value indicates more similar (stable) partitions. Both splitting of clusters and merging of clusters lower the value of the indices.
}
\note{
The special cases of the modified indices (when only outgoers or only newcomers are present) are automatically considered within these functions.
}
\references{
Cugmas, M., & Ferligoj, A. (2018). Comparing two partitions of non-equal sets of units. Advances in Methodology and Statistics, 15(1), 1-21.
}
\author{
Marjan Cugmas
}
\examples{
# Examples from Cugmas and Ferligoj (2018) paper:
data(examples)
# increase k in real analyses
# EXAMPLES: A, B, C, D
par(mfrow = c(4, 4))
for (i in 1:4){
  U <- fromTableToVectors(examples[[i]])[,1]
  V <- fromTableToVectors(examples[[i]])[,2]

  cat("MARI", MARI(U = U, V = V, k = 100), "\n")
}

# EXAMPLES: E, F, G, H
for (i in 13:16){
  U <- fromTableToVectors(examples[[i]])[,1]
  V <- fromTableToVectors(examples[[i]])[,2]

  U[which(max(as.numeric(as.character(U))) == as.numeric(as.character(U)))] <- NA
  V[which(max(as.numeric(as.character(V))) == as.numeric(as.character(V)))] <- NA

  cat("MARI", MARI(U = U, V = V, k = 100), "\n")
}

# EXAMPLES: I, J, K, L
for (i in 5:8){
  U <- fromTableToVectors(examples[[i]])[,1]
  V <- fromTableToVectors(examples[[i]])[,2]

  V[which(max(as.numeric(as.character(V))) == as.numeric(as.character(V)))] <- NA

  cat("MARI", MARI(U = U, V = V, k = 100), "\n")
}

# EXAMPLES: M, N, O, P
for (i in 9:12){
  U <- fromTableToVectors(examples[[i]])[,1]
  V <- fromTableToVectors(examples[[i]])[,2]

  U[which(max(as.numeric(as.character(U))) == as.numeric(as.character(U)))] <- NA

  cat("MARI", MARI(U = U, V = V, k = 100), "\n")
}

}
