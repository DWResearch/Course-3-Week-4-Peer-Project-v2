# Coursera JHU Data Specialization Course 3 Week 4 Peer Project
# Prepare R Studio
remove(list=ls())
getwd()
setwd("C:/Users/Dana/Documents/Coursera-R/R Data/dataC3W4Peer/UCI HAR Dataset")
#
# load anticipated packages
library (plyr); library(dplyr)
#
# Task 1 in assignment: Merge the training and the test sets to create one data set.
# Get data from train folder
#
tr_sub_dat = read.table("./train/subject_train.txt")
tr_act_dat = read.table("./train/y_train.txt")
tr_X_dat = read.table("./train/X_train.txt")
dim(tr_sub_dat); dim(tr_act_dat); dim(tr_X_dat); 
tr_dat <- cbind(tr_sub_dat, tr_act_dat, tr_X_dat) #merge the three files from train folder
te_sub_dat = read.table("./test/subject_test.txt")
te_act_dat = read.table("./test/y_test.txt")
te_X_dat = read.table("./test/X_test.txt")
te_dat <- cbind(te_sub_dat, te_act_dat, te_X_dat)
dim(te_sub_dat); dim(te_act_dat); dim(te_X_dat); 
merged_dat <- rbind(tr_dat, te_dat) #merge train and test data files
#
# Task 4 in assignment: Appropriately labels the data set with descriptive variable names. 
# use the second column of feature.txt, transpose it, and apply as column labels for merged_dat
#
features = read.table("./features.txt")
colnames(merged_dat) <- c("subject", "activity", t(features[2]))
#
# Task 2 in assignment: Extracts only the measurements on the mean and standard deviation 
# for each measurement
# filter the new column lablels for the word mean or std

merged_dat2 <- merged_dat[, c(1,2,grep("[Mm]ean()|std()", names(merged_dat)))]
# do not use "[Mm]ean"|"std()"

# Task 3 in assignment: Use the descriptive activity names to name the activities in the dataset
merged_dat2$activity <- recode(merged_dat$activity, "1" = "walking", "2" = "walking_upstairs", 
        "3" = "walking_downstairs", "4" = "sitting", "5" = "standing", "6" = "laying")

# Task 5 in assignment:From the data set in step 4, creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject
#
# sort by subject and then activity
merged_dat2<- arrange(merged_dat2, subject, activity)
# prep grouping by subject and activity, followed by summary of each variable
by_group <- group_by(merged_dat2, subject, activity) 
output <- summarize_all(by_group, mean)
write.table(output, "tidy_data_fitness_data.txt", row.name=FALSE, sep="\t")




