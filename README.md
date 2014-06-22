# Getting and Cleaning Data Course Project
This document describes everything we did for this Course Project

## Step by step explanation of steps followed
Raw data consists of measurements of 561 features from 30 volunteers split into training and test datasets. 

There is only one script that does all the work, called run_analysis.R. The script sets the working directory and loads the dplyr library which is the main one we 'll use to do the data manipulation.

- We first load the activity labels (activity_labels), and the features (features) in the corresponding R objects.
- We then load the train set (df_train).
- Then we load the labels of the training set (train_labels).
- Afterwards, we need to map the train_labels that are integers, to the actual activity labels. in order to do that we turn the integer labels into a factor, and then set its levels to be the names of the actual activity labels. This creates label_named.
- Then we load the train sujects (subject_train)
- The next step is to bring all the train set together. We used rbind to bring together into a single dataframe called **train**, the train data, the subject id, the train labels and the actual activity labels 
- We repeat the previous steps for the test set and we end up with **test** dataframe

After we have created the **train** and **test** datasets, and we have made sure they comprise of the same column names, we just need to put them together into one dataset with rbind. This gives us the dataframe called **total**. We wrap it with a tbl_df() to use with dplyr functionality. 

Following that, we want to keep only the columns that have to do with mean or standar deviation, so we use a regular expression pattern to get those. Then we need to make sure we keep the subject id, label and activity_label (label_named) as well.

At this point we should pick more descriptive names for the activities. We kept the meaningful parts and left out the dots introduced by merging. More details about the names can be found in the CodeBook.md

Finally, we use the chaining of dplyr, produce the average of each variable for each activity and each subject, and we write that to a file called tidy.txt.

Thank you for following this README. 



