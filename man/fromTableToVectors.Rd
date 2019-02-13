\name{fromTableToVectors}
\alias{fromTableToVectors}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
From Contingency Table to Data Frame
}
\description{
It covert a given contingency table to a data frame.
}
\usage{
fromTableToVectors(cont.table)
}
\arguments{
  \item{cont.table}{contingency table (a data frame with rownames and columnames)}
}
\value{
A data frame with n rows and 2 columns. The first column corresponds to the rows of the contingency table while the second column correspond to the columns of the contingency table.
}
\author{
Marjan Cugmas
}
\examples{
data <- rbind(c(0, 10, 0, 0, 0),
                    c(0, 10, 0, 0, 0),
                    c(0, 0, 10, 0, 0),
                    c(0, 0,  0, 5, 5))
rownames(data) <- 1:4
colnames(data) <- 1:5
fromTableToVectors(cont.table = data)
}
