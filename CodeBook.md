The output file titled "tidy_table_fitness_data.txt" contains 180 obervations of 88  variables (columns) with column names.

The first column is subject of which there are 30.
The second column is the activity of which there are 6. They include walking, walking upstairs, walking downstairs, sitting, standing, and laying. 
The remaining 86 variables are the mean and standard deviation of the following variables:

tBodyAcc-XYZ  
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

For the above variables with XYZ, there are 3 not one variable for the x,y, and z-axis.
Note that variables containing "meanfrequency" were not extracted.

The steps to create the output file is summarized below. More detail is provided in the R script.
=============

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

You should create one R script called run_analysis.R that does the following.

Task 1: Merge the training and the test sets to create one data set.

I extracted data from the following files in the training folder: 
'train/X_train.txt': Training set; 
'train/y_train.txt': Training labels.
I then extracted data from the following files in the testing folder: 
'test/X_test.txt': Test set.
'test/y_test.txt': Test labels.
I then merged them.

Task 2: Extract only the measurements on the mean and standard deviation for each measurement.
From the features.txt file in the main UCI HAR folder, I extracted data on the number and measurements which contained "mean" and "std."

Task 3: Use descriptive activity names to name the activities in the data set
From the acitivity_labels.txt file in the main UCI HAR folder, I extracted the number and corresponding activities label from the file: activity_labels.txt.
I then replaced the number reflecting the activities in the dataset with the activity labels.

Task 4: Appropriately labels the data set with descriptive variable names.
Task 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
