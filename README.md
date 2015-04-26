# Course-Project-Getting_cleaning_data
Course project of the Coursera Josh Hopkins course "Getting and Cleaning data"
This prgam solves the problem in the final course project:

1) Merges the training and the test sets to create one data set.
2) Extracts only the measurements on the mean and standard deviation for each measurement. 
3) Uses descriptive activity names to name the activities in the data set
4) Appropriately labels the data set with descriptive variable names. 
5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

There are (or there must be) two directories in the working directory: ./train nad ./test, each of the containing 3 files: subject_train/test.txt, X_train/test.txt and y _train/test.tt. In the working directorry there mst be an activity_labels.txt and a features.txt files. 

The program reads all those files, and add a column in both X_ datasets (test and train) to indicate whether the sample is 'test' or 'train'. This is something not specified in the problem description but I think it is worth to keep the info

It binds (rbind) all the data.frames x, y and subject in a single data.frame, and puts labels in the column names. I use the labels that appear in the activity_labels.txt file. As there are 1 new extra column (type of sample) and two other tables that will be added later to the full dataset (y and subject), I put the names of those columns also

It Binds (c bind) all 3 tables in one only

This is the end of point 1) of the problem. 


To do the second step, first, extract all the columns named including "std" or "mean", using grep in the labels read from activity_lables.txt, and extract those columns from the original dataset

This is the end of point 2) of the problem. 


To point 3), we have to names in activities ("y" = code 1 to 6, "activity" = the name) and merge both tables by the field "y", and delete the column "y" itself from the resulting data.frame. This creates a joined table, connected by the "y" columns of both tables

This is the end of point 3) of the problem. 

Point 4) has already been done in point 1) of the problem

Regards point 5), I use the "aggregate" function to summarize all he data gouped by activity and subject





