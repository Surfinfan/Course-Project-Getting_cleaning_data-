## Course Project "Getting and Cleaning Data"
## Author: A. Muñoz
## Date: 24/April/2015


## ---------------------------------------------------------------------------------------------------------------
## Point 1 of the problem: Merges the training and the test sets to create one data set. 
## First, read the data in the files
## It is assumed tht the working directory is the directory where we can find the /test and /train directories

labels <- read.table("./features.txt")
activity_labels <- read.table("./activity_labels.txt")

x_test <- read.table("./test/X_test.txt")
y_test <- read.table("./test/y_test.txt")
subject_test <- read.table("./test/subject_test.txt")

x_train <- read.table("./train/X_train.txt")
y_train <- read.table("./train/y_train.txt")
subject_train <- read.table("./train/subject_train.txt")


## Add a column in both datasets (test and train) to indicate whether the sample is 'test' or 'train'
## this is something not specified in the problem description but I think it is worth to keep the info

x_test$type <- "test"
x_train$type <- "train"


## bind all the data.frames x, y and subject in a single data.frame

x_all <- rbind(x_test, x_train)
y_all <- rbind(y_test, y_train)
subject_all <- rbind(subject_test, subject_train)


## Put labels in the column names. I use the labels that appear in the activity_labels.txt file
## As there are 1 new extra column (type of sample) and two other tables that will be added later to the full
## dataset (y and subject), I put the names of those columns also

names(x_all) <- labels$V2
names(x_all)[562] <- "type"
names(y_all) <- c("y")
names(subject_all) <- c("subject")


## Bind all 3 tables in one only

df_all <- cbind (x_all, y_all)
df_all <- cbind (df_all, subject_all)

## df_all contains the full dataset, with y and subject columns at the end
## This is the end of point 1) of the problem. 

## ---------------------------------------------------------------------------------------------------------------




## Point 2 of the problem: Extracts only the measurements on the mean and standard deviation for each measurement. 

# First, extract all the columns named including "std" or "mean"
df_meanstd <- df_all[, grep("Mean|std", labels$V2, ignore.case = TRUE)]


## df_meanstd now contains a table with only the columsn labelled with mean ad standard deviation for each measurement
## This is the end of point 2) of the problem

## ---------------------------------------------------------------------------------------------------------------




## Point 3 of the problem: Uses descriptive activity names to name the activities in the data set

# Put names in activities ("y" = code 1 to 6, "activity" = the name)
names(activity_labels) <- c("y", "activity")

# And merge both tables by the field "y", and delete the column "y" itself from the resulting data.frame
df_tst <- merge (df_all, activity_labels, by = "y")
df_tst <- df_tst[, !(names(df_tst) %in% c("y"))]

## df_tst now is a table with the same columns that the original dataset, but with "activity" instead of "y"
## This is the end of point 3) of the problem

## ---------------------------------------------------------------------------------------------------------------




## Point 4 of the problem: Appropriately labels the data set with descriptive variable names. 

## This is already done in step 1 of the problem. The dataset already have descriptive names

## ---------------------------------------------------------------------------------------------------------------




## Point 5 of the problem: From the data set in step 4, creates a second, independent tidy data set
##                         with the average of each variable for each activity and each subject.

df_means <- aggregate(df_all[1:561], list(df_all$y, df_all$subject), mean)
names(df_means)[1] <- "activity"
names(df_means)[2] <- "subject"

## df_means is a data.frame with one line for each activity and subject, containing the mean for each column
## of the original dataset

