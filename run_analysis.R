setwd("D:\\Coursera\\Getting and Cleaning Data\\project\\gcdata")
library(dplyr)

df_train <- read.csv("data/train/X_train.txt", sep ="", header= F)

df_test <- read.csv("data/test/X_test.txt", sep ="", header = F)
test_lab <- 
