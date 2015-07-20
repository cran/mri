\name{mari1}
\alias{mari1}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Modified Adjusted Rand Index 1
}
\description{
\code{mari1} is used to compute the value of the Modified Adjusted Rand Index 1. It considers two partitions \eqn{U} and \eqn{V'}, which are usually obtained on two sets of units \eqn{S} and \eqn{T}, where \eqn{T} is a subset of \eqn{S}. Because two vectors \eqn{U} and \eqn{V} do not have the same length, the cluster of units, which are not present in the partition \eqn{V}, need to be added to the partition \eqn{V} (denoted as \eqn{V'}). This can be done manually or with function \code{\link{merge}}.
}
\usage{
mari1(U, V, outgoing.name, k = 500)
}

\arguments{
  \item{U}{Partition U.}
  \item{V}{Partition V'.}
  \item{outgoing.name}{The label of added cluster (see Description). Do not specify this argument if there is no added values.}
  \item{k}{Number of permutations.}
}

\value{
The function returns the value of the Modified Adjusted Rand Index 1. The expected value of the index in the case of two random and independant partitions is 0. The maximum value of the index is 1. Higher value indicates more similar (stable) partitions. The splitting of clusters lowers the value of the index, but the merging of clusters does not affect the value of the index.
}

\references{
Cugmas M. and Ferligoj A. (2015). On comparing partitions. \emph{submitted}
}
\author{
Marjan Cugmas
}

\seealso{
Other types of Modified Rand Index: \code{\link{mri21}}, \code{\link{mri22}}.

Modified Adjusted Rand Index: \code{\link{mari1}}, \code{\link{mari21}}, \code{\link{mari22}}.
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

# example 1
cont.table <- rbind(c(0, 10, 0, 0, 0),
                c(10, 0, 0, 0, 0),
                c(0, 0, 10, 0, 0),
                c(0, 0,  0, 5, 5))
rownames(cont.table) <- c(1:4)
colnames(cont.table) <- c(1:5)
example.Model[[1]] <- cont.table

# example 2
cont.table <- rbind(c(0, 10, 0, 0, 0),
                c(0, 10, 0, 0, 0),
                c(0, 0, 10, 0, 0),
                c(0, 0,  0, 5, 5))
rownames(cont.table) <- c(1:4)
colnames(cont.table) <- c(1:5)
example.Model[[2]] <- cont.table

# example 3
cont.table <- rbind(c(0,  0, 0, 0, 0),
                c(10, 10, 0, 0, 0),
                c( 0,  0, 10, 0, 0),
                c(0, 0,  0,   5, 5))
rownames(cont.table) <- c(1:4)
colnames(cont.table) <- c(1:5)
example.Model[[3]] <- cont.table

# COMPUTE MRI1
# example 1
U <- fromTableToVectors(example.Model[[1]])[,1]
V <- fromTableToVectors(example.Model[[1]])[,2]
mari1(U = U, V = V, outgoing.name = 4, k = 500)

# example 2
U <- fromTableToVectors(example.Model[[2]])[,1]
V <- fromTableToVectors(example.Model[[2]])[,2]
mari1(U = U, V = V, outgoing.name = 4, k = 500)

# example 3
U <- fromTableToVectors(example.Model[[3]])[,1]
V <- fromTableToVectors(example.Model[[3]])[,2]
mari1(U = U, V = V, outgoing.name = 4, k = 500)
}

