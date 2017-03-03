The output file titled "tidy_table_fitness_data.txt" contains 180 obervations of 88  variables (columns) with column names. It summarizes mean and standard deviation of an experiment on fitness at UC Irvine.  The raw data that yielded the ouput file came from a downloaded zip file:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

A full description of the data can be found here:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Experiment as described in the above link:
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

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

Characteristics of the output file:
The first column is subject of which there are 30.
The second column is the activity of which there are 6. They include walking, walking upstairs, walking downstairs, sitting, standing, and laying. 

The remaining 86 variables are the mean and standard deviation of the aforementioned measurement variables.
For the above variables with XYZ, there are 3 not one variable for the x,y, and z-axis.
Note that variables containing "meanfrequency" were not extracted.

The steps to create the output file is summarized below. More detail is provided in the R script.
=============
There were five tasks associated with this assignment. I used the packages plyr and dplyr.

Task 1: Merge the training and the test sets to create one data set.

I extracted data from the following files in the training folder: 
'train/subject_train.txt': subject; 
'train/y_train.txt': activity labels;
'train/X_train.txt: measurements.
I then extracted data from the following files in the testing folder: 
'test/subject_test.txt': subject; 
'test/y_test.txt': activity labels;
'test/X_test.txt: measurements.
The merged data frame contained 10299 observations of 563 variables.

Task 4: Appropriately labels the data set with descriptive variable names.
I decided to carry out Task 4 next.
I pulled the names of the labels from "features.txt" in the  main folder.
I transposed this file.
I then replaced all the labels for the measurement columns in the merged data set as well as relabelled the first column, subject, and the second column, activity.

Task 2: Extract only the measurements on the mean and standard deviation for each measurement.
From the features.txt file in the main UCI HAR folder, I subsetted the data and selected only those which contained either "mean" and "std()" in the measurement columns. I left the first two columns on subject and ID intact.
The subsetted data frame contained 10299 obervations of 88 variables.

Task 3: Use descriptive activity names to name the activities in the data set
I recoded the number in the second column labelled "activity" and recoded them as
1=walking
2=walking upstairs
3=walking downstairs
4=sitting
5=sitting
6=laying

Task 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
I rearranged the data frame from previous task by subject and then activity.
I then grouped them by subject and activity and then collapsed the measurement data and generated summary means.
This collapsed the large data frame into 180 observations of 88 variables.
I then created an output file called "tidy_data_fitness_data.txt."
