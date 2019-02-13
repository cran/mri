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
