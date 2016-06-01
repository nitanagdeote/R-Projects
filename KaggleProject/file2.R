r <- raster(ncols = 10, nrows = 10)
r[] <- a
plot(r)

b <- train_masks$pixels[60]
r1 <- raster(ncols = 10, nrows = 10)
r1[] <- b
plot(r1)
  
source("http://bioconductor.org/biocLite.R")
biocLite()
biocLite("EBImage")
source("http://www.rforge.net/png/")
readImage()