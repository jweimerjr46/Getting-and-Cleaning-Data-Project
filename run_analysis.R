## Jerry Weimer
## R version 3.4.0 (2017-04-21)
## Merge the training and test sets to create one data set.
# set working directory to "UCI HAR Dataset" folder from unzipped file.
library(plyr)
library(dplyr)
library(tidyr)
setwd("C:/Data Science Coursera/Third Class/Week 4/UCI HAR Dataset")

# reads each of the files for the test and training sets
x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
subject_test <- read.table("test/subject_test.txt")

x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")
subject_train <- read.table("train/subject_train.txt")

# Get feature names and activity labels
features <- as.vector(read.table("features.txt")[,2])
activityLabels = read.table("activity_labels.txt")

# Merges test and training sets and sets column names
test_merge <- cbind(subject_test, x_test, y_test)
train_merge <- cbind(subject_train, x_train, y_train)
all_merged <- rbind(test_merge, train_merge)

# Gives column names and activity labels
colnames(all_merged)<-c("subject_ID",features,"activity_ID")

## Extract measurements on the mean and standard deviation for each measurement
colNames<-colnames(all_merged)

# Get indices of column names that only contain the means and standard deviations
mean_sd <- (grepl("mean.." , colNames) | 
            grepl("std.." , colNames) |
            grepl("activity_ID" , colNames) | 
            grepl("subject_ID" , colNames) )

# Extracts columns containing means and standard deviations
tidy1<-all_merged[,mean_sd]

# Gives activities appropriate names
tidy1$activity_ID<-mapvalues(tidy1$activity_ID, 
                                   from = activityLabels[,1], 
                                   to = as.vector(activityLabels[,2]))

# Finds the average of each variable for each activity and subject
tidy2 <- tidy1 %>% 
      group_by(subject_ID, activity_ID) %>% 
      summarize_all(funs(mean))

write.table(tidy2, file = "tidydata.txt", row.names = FALSE, col.names = TRUE)




