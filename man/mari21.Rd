\name{mari21}
\alias{mari21}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Modified Adjusted Rand Index 2.1
}
\description{
\code{mari21} is used to compute the value of the Modified Adjusted Rand Index 2.1. It considers two partitions \eqn{U'} and \eqn{V}, which are usually obtained on two sets of units \eqn{S} and \eqn{T}, where \eqn{S} is a subset of \eqn{T}. Because two vectors \eqn{U} and \eqn{V} do not have the same length, the cluster of units, which are not present in the partition \eqn{U}, need to be added to the partition \eqn{U} (denoted as \eqn{U'}). This can be done manually or with function \code{\link{merge}}.
}
\usage{
mari21(U, V, incoming.name, k = 500)
}

\arguments{
  \item{U}{Partition U'.}
  \item{V}{Partition V.}
  \item{incoming.name}{The label of added cluster (see Description). Do not specify this argument if there is no added values.}
  \item{k}{Number of permutations.}
}

\value{
The function returns the value of the Modified Adjusted Rand Index 2.1. The expected value of the index in the case of two random and independant partitions is 0. The maximum value of the index is 1. Higher value indicates more similar (stable) partitions. The splitting of clusters lowers the value of the index, but the merging of clusters does not affect the value of the index. The difference in the number of units between two sets of units \eqn{S} and \eqn{T} lower the value of the index.
}

\references{
Cugmas M. and Ferligoj A. (2015). On comparing partitions. \emph{submitted}
}
\author{
Marjan Cugmas
}

\seealso{

Other types of Modified Rand Index: \code{\link{mri1}}, \code{\link{mri21}}, \code{\link{mri22}}.

Modified Adjusted Rand Index: \code{\link{mari1}}, \code{\link{mari22}}.
}
\examples{
# THIS FUNCTION CONVERT THE CONTINGENCY TABLE INTO TWO VECTORS
fromTableToVectors <- function(cont.table){
  dat <- matrix(ncol = 2)
  for (j in 1:dim(cont.table)[2]){
    for (i in 1:dim(cont.table)[1]){
      if (cont.table[i, j] >= 1){
        for (t in 1:cont.table[i,j]){
          imei <- rownames(cont.table)[i]
          imej <- colnames(cont.table)[j]
          dat <- rbind(dat, c(imei, imej))
        }
      }
    }
  }
  dat <- dat[-1,]
  return(dat)
}

# DATA
example.Model <- list(NULL)

tabela <- rbind(c(0, 10, 0, 0, 0),
                c(10, 0, 0, 0, 0),
                c(0, 0, 10, 0, 0),
                c(0, 0,  0, 5, 5))
rownames(tabela) <- c("1", "2", "3", "4")
colnames(tabela) <- c("1", "2", "3", "4", "5")
example.Model[[1]] <- t(tabela)

tabela <- rbind(c(0, 10, 0, 0, 0),
                c(0, 10, 0, 0, 0),
                c(0, 0, 10, 0, 0),
                c(0, 0,  0, 5, 5))
rownames(tabela) <- c("1", "2", "3", "4")
colnames(tabela) <- c("1", "2", "3", "4", "5")
example.Model[[2]] <- t(tabela)

tabela <- rbind(c(0,  0, 0, 0, 0),
                c(10, 10, 0, 0, 0),
                c( 0,  0, 5, 0, 5),
                c(0, 0,  0,   5, 5))
rownames(tabela) <- c("1", "2", "3", "4")
colnames(tabela) <- c("1", "2", "3", "4", "5")
example.Model[[3]] <- t(tabela)

# COMPUTE MRI22

# example 1
U <- fromTableToVectors(example.Model[[1]])[,1]
V <- fromTableToVectors(example.Model[[1]])[,2]
mari21(U = U, V = V, incoming.name = 4, k = 500)

# example 2
U <- fromTableToVectors(example.Model[[2]])[,1]
V <- fromTableToVectors(example.Model[[2]])[,2]
mari21(U = U, V = V, incoming.name = 4, k = 500)

# example 3
U <- fromTableToVectors(example.Model[[3]])[,1]
V <- fromTableToVectors(example.Model[[3]])[,2]
mari21(U = U, V = V, incoming.name = 5, k = 500)
}

