
library(sp)
library(raster)
library(rgdal)
a <- raster("~/Desktop/1_1.tif")

train_masks <- read.csv("~/Downloads/train_masks.csv")
b <- train_masks$pixels[1]

c <- raster(10,10)
c[] <- a

image(c)
