setwd("D:\\Coursera\\Getting and Cleaning Data\\project\\gcdata")
library(dplyr)

#Reading in the activity labels
activity_labels <- read.csv("data/activity_labels.txt", header= F, sep= "", stringsAsFactors= F, col.names= c("order","labels"))

#$eading in the feature names
features <- read.csv("data/features.txt", header= F, sep= "", stringsAsFactors= F, col.names= c("order", "feature"))

###########
# TRAIN SET
###########

#Reading in the train set
df_train <- read.csv("data/train/X_train.txt", sep= "", header= F)

#Reading in the train labels
train_labels <- read.csv("data/train/y_train.txt", header= F, col.names= "label")

#Mapping the train labels to the actual activity labels. We first turn into a factor, and then set the levels to the activity labels
train_labels_named <- factor(train_labels$label)
levels(train_labels_named) = activity_labels$labels

#Reading in the train set subjects

##########
# TEST SET
##########

#Reading in the test set
df_test <- read.csv("data/test/X_test.txt", sep= "", header= F, col.names= features$feature)

#Reading in the test labels
test_labels <- read.csv("data/test/y_test.txt", header= F, col.names= "label") 

#Mapping the test labels to the actual activity labels. We first turn into a factor, and then set the levels to the activity labels
label_named <- factor(test_labels$label)
levels(label_named) = activity_labels$labels

#Reading in the test set subjects
subject_test <- read.csv("data/test/subject_test.txt", header= F, col.names= "subject")

#Bringing together the test dataset
test <- cbind(df_test, subject_test, test_labels, label_named)
