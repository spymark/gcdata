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
df_train <- read.csv("data/train/X_train.txt", sep= "", header= F, col.names= features$feature)

#Reading in the train labels
train_labels <- read.csv("data/train/y_train.txt", header= F, col.names= "label")

#Mapping the train labels to the actual activity labels. We first turn into a factor, and then set the levels to the activity labels
label_named <- factor(train_labels$label)
levels(label_named) = activity_labels$labels

#Reading in the train set subjects
subject_train <- read.csv("data/train/subject_train.txt", header= F, col.names= "subject")

#Bringing together the train dataset
train <- cbind(df_train, subject_train, train_labels, label_named)


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

#Bringing it all together
total <- rbind(train,test)
total <- tbl_df(total)

#subset the columns that contain Mean or SD
#We make a regex to find which columns have name containing Mean, mean or std
keep <- grepl(names(total),pattern= ".*[Mm]ean.*|.*std.*")
#We need to do the following trick because we want the logical indices of keep, and also the last 3 columns we have added
base <- names(total)[keep]
keep_all <- c(base,"subject","label","label_named")
#And use that to subset. 
total <- total[,keep_all]

#descriptive names for activities already added
#Appropriately labels the data set with descriptive variable names

#Create a second, independent tidy data set with the average of each variable for each activity and each subject
#Here we will use chaining to try and do this in one go with dplyr :)
total_avg <- total%.%group_by(subject,label_named)%.%summarise_each(funs(mean))
write.csv(total_avg,"tidy.txt",sep= ',') 


