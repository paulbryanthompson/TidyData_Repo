Codebook - Getting and Cleaning Data - Tidy Data Preparation

Author: Paul Thompson

The data source

Datasets: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Data Set Information:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.



The dataset includes the following files:


•‘README.txt’
•‘features_info.txt’: Shows information about the variables used on the feature vector.
•‘features.txt’: List of all features.
•‘activity_labels.txt’: Links the class labels with their activity name.
•‘train/X_train.txt’: Training set.
 - Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
 - Triaxial Angular velocity from the gyroscope. 
 - A 561-feature vector with time and frequency domain variables. 
•‘train/y_train.txt’: Training labels.
•‘test/X_test.txt’: Test set.
 - Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
 - Triaxial Angular velocity from the gyroscope. 
 - A 561-feature vector with time and frequency domain variables. 
•‘test/y_test.txt’: Test labels.
The acceleration signal from the smartphone accelerometer X,Y,Z axis in standard gravity units ‘g’. Every row shows a 128 element vector. The same description applies for the ‘total_acc' and 'body_acc' and body_gyro' tables below. 
•‘train/Inertial Signals/body_acc_x_train.txt’
•‘train/Inertial Signals/body_acc_y_train.txt’
•‘train/Inertial Signals/body_acc_z_train.txt’
•‘train/Inertial Signals/body_gyro_x_train.txt’
•‘train/Inertial Signals/body_gyro_y_train.txt’
•‘train/Inertial Signals/body_gyro_z_train.txt’
•‘train/Inertial Signals/total_acc_x_train.txt’
•‘train/Inertial Signals/total_acc_y_train.txt’
•‘train/Inertial Signals/total_acc_z_train.txt’
The acceleration signal from the smartphone accelerometer X,Y,Z axis in standard gravity units ‘g’. Every row shows a 128 element vector. The same description applies for the ‘total_acc' and 'body_acc' and body_gyro' tables below. 
•‘test/Inertial Signals/body_acc_x_test.txt’
•‘test/Inertial Signals/body_acc_y_test.txt’
•‘test/Inertial Signals/body_acc_z_test.txt’
•‘test/Inertial Signals/body_gyro_x_test.txt’
•‘test/Inertial Signals/body_gyro_y_test.txt’
•‘test/Inertial Signals/body_gyro_z_test.txt’
•‘test/Inertial Signals/total_acc_x_test.txt’
•‘test/Inertial Signals/total_acc_y_test.txt’
•‘test/Inertial Signals/total_acc_z_test.txt’

Transformation Details

1.Merges the training and the test sets to create one data set.
2.Extracts only the measurements on the mean and standard deviation for each measurement. 
3.Uses descriptive activity names to name the activities in the data set
4.Appropriately labels the data set with descriptive variable names. 
5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

How to run the analysis

1. Download the file run_analysis.R to a local directory on your PC.
2. Open run_analysis.R in R Studio.
3. Click on the link https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and download the data to a directory on your computer.
4. Extract the contents of the zip file to your "C:\" root directory.  A new directory called "C:\UCI HAR Dataset" will be created.  This is the working directory in the run_analysis.R script.
5. Run the script. This will source the various .txt files in the "C:\UCI HAR Dataset" directory, do the analysis and create a tidy dataset (named tidyMean.txt) in the working directory.

