run_analysis.R

The aim of the script is to create a dataset which meets the tidy data principles of where each measurement variable has its own column and each different observation of that variable is in a different row.  The run_analysis.R script achieves this by creating a tidy dataset of 180 rows by 89 columns where each unique combination of ID vars has its own row and each column is the mean of the measure vars.  

Please note that the 'Inertial Signals' data is NOT relevant for this analysis but is downloaded as part of the zip file outlined in step 3 below.

How to run the analysis

1. Download the file run_analysis.R to a local directory on your PC.
2. Open run_analysis.R in R Studio.
3. Click on the link https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and download the data to a directory on your computer.
4. Extract the contents of the zip file to your "C:\" root directory.  A new directory called "C:\UCI HAR Dataset" will be created.  This is the working directory in the run_analysis.R script.
5. Run the script. This will source the various .txt files in the "C:\UCI HAR Dataset\" directory, do the analysis and create a tidy dataset (named tidyMean.txt) in the working directory.

