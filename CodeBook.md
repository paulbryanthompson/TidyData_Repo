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
•‘train/X_train.txt’: Training set. 7352 rows
 - Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
 - Triaxial Angular velocity from the gyroscope. 
 - A 561-feature vector with time and frequency domain variables. 
•‘train/y_train.txt’: Training labels. 7352 rows
•‘train/subject_train.txt': Subject identifier for each row - 7352 rows
•‘test/X_test.txt’: Test set. 2947 rows
 - Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
 - Triaxial Angular velocity from the gyroscope. 
 - A 561-feature vector with time and frequency domain variables. 
•‘test/y_test.txt’: Test labels. 2947 rows
•‘test/subject_test.txt': Subject identifier for each row - 2947 rows
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
- the training datasets each have 7352 rows.  The column names were made syntactically correct prior to merging them into a 
- single file.  Once the column headings were corrected, the X_train, y_train, and subject_train dataframes were bound
- together using cbind.  This was also done for the test datasets and finally the training and test dataframes were merged
- into one dataframe called df_tt.
2.Extracts only the measurements on the mean and standard deviation for each measurement.
- once the columns were made syntactically correct and training and test dataframes have been merged, a final
- dataframe is created called df_tt meaning a dataframe composed of test+train rows.  A final dataframe is then created
- that includes ONLY the ID columns (subject.id, activity.name, activity.id) AND any column that contains "mean" OR "std"
- in the name.  The final dataframe df_Subset is created.
3.Uses descriptive activity names to name the activities in the data set
- The activity labels table is a look up table that links to the y_train dataframe.  A new column was created and populated
- with the activity name.  This was also done with the test dataframe.
4.Appropriately labels the data set with descriptive variable names. 
- prior to the merging of the train and test data, the features.txt column names were made syntactically correct by 
- using the sub function to replace various characters such as "()-_," with "".  
5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
- A long and narrow molten dataset 'tidyMelt' was created using 'melt' with unique IDs created from
- 'activity.id'+'subject.id'+'activity.name'.  Each row was specific to each unique ID and measurement variable 
- such as tBodyAccstdX.  
- The final Tidy Dataset was created using the molten data 'tidyMelt'.  The mean was added for all the mean and std
- measurement columns resulting in 180 rows and 89 columns.


