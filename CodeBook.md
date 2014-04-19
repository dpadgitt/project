# run_analysis.R

## Overview

### "run_analysis.R" takes no parameters and does the following: 

#### 1. Merges the training and the test sets to create one data set.

*Assumes  the unzipped Samsung data is in the current working directory, with files and "UCI HAR Dataset" directory structure as originally provided.*

a. First it loads the training and test data for the dependent and explanatory variables (y,X) and test subject into the data tables trainy, testy, trainX, testX, subjtrain and subjtest.

b. Then it completes the merge, creating the following data tables for the dependent and measurement (explanatory) variables (y and X respectively) and test subject:

* **ally**
* **allX**
* **allsubj**

#### 2. Extracts only the measurements on the mean and standard deviation for each measurement.  
*For the purpose of this analysis, since an exact definition of "measurements on the mean and standard deviation for each measurement" isn't provided, we'll err on the side of providing too much data rather than possibly omitting wanted data.  Therefore, we assume "mean" refers to any measured (explanatory) variable that contains either the string "-mean()" or "Mean", and standard deviation refers to any that contains the string "-std()".  The result is a selection of 73 variables.*

The measurements on the mean and standard deviation are stored in the following data table:

* **X**

#### 3. Uses descriptive activity names to name the activities in the data set

*For the purpose of this analysis, it is assumed that the activities included in the **activity_labels.txt** file are suitable "descriptive activity names".*

#### 4. Appropriately labels the data set with descriptive activity names. 

Creates the following data table for the dependent variable, replacing each activity code with one of six "descriptive activity names":

* **y**

The six "descriptive activity names" are:
* LAYING
* SITTING
* STANDING
* WALKING
* WALKING_DOWNSTAIRS
* WALKING_UPSTAIRS

#### 5. Creates a second, independent tidy data set with the average of each variable for each activity and each of the 30 test subjects. 

*For the purpose of this analysis, it is assumed that we're tidying up the data set consisting of "only the measurements on the mean and standard deviation for each measurement", or in other words the selection of 73 variables, as opposed to the entire data set of 561 measured (explanatory) variables.*

Creates the following data table:

* **tidy**

The "tidy" data table contains the following columns:

* subject
* activity

* *The following colums contain mean values averaged over all experiments for a given test subject.  Documentation for the underlying variables is provided in the README.txt file included in the Data Folder with the original experimental data from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#.*

* tBodyAcc-mean()-X
* tBodyAcc-mean()-Y
* tBodyAcc-mean()-Z
* tBodyAcc-std()-X
* tBodyAcc-std()-Y
* tBodyAcc-std()-Z
* tGravityAcc-mean()-X
* tGravityAcc-mean()-Y
* tGravityAcc-mean()-Z
* tGravityAcc-std()-X
* tGravityAcc-std()-Y
* tGravityAcc-std()-Z
* tBodyAccJerk-mean()-X
* tBodyAccJerk-mean()-Y
* tBodyAccJerk-mean()-Z
* tBodyAccJerk-std()-X
* tBodyAccJerk-std()-Y
* tBodyAccJerk-std()-Z
* tBodyGyro-mean()-X
* tBodyGyro-mean()-Y
* tBodyGyro-mean()-Z
* tBodyGyro-std()-X
* tBodyGyro-std()-Y
* tBodyGyro-std()-Z
* tBodyGyroJerk-mean()-X
* tBodyGyroJerk-mean()-Y
* tBodyGyroJerk-mean()-Z
* tBodyGyroJerk-std()-X
* tBodyGyroJerk-std()-Y
* tBodyGyroJerk-std()-Z
* tBodyAccMag-mean()
* tBodyAccMag-std()
* tGravityAccMag-mean()
* tGravityAccMag-std()
* tBodyAccJerkMag-mean()
* tBodyAccJerkMag-std()
* tBodyGyroMag-mean()
* tBodyGyroMag-std()
* tBodyGyroJerkMag-mean()
* tBodyGyroJerkMag-std()
* fBodyAcc-mean()-X
* fBodyAcc-mean()-Y
* fBodyAcc-mean()-Z
* fBodyAcc-std()-X
* fBodyAcc-std()-Y
* fBodyAcc-std()-Z
* fBodyAccJerk-mean()-X
* fBodyAccJerk-mean()-Y
* fBodyAccJerk-mean()-Z
* fBodyAccJerk-std()-X
* fBodyAccJerk-std()-Y
* fBodyAccJerk-std()-Z
* fBodyGyro-mean()-X
* fBodyGyro-mean()-Y
* fBodyGyro-mean()-Z
* fBodyGyro-std()-X
* fBodyGyro-std()-Y
* fBodyGyro-std()-Z
* fBodyAccMag-mean()
* fBodyAccMag-std()
* fBodyBodyAccJerkMag-mean()
* fBodyBodyAccJerkMag-std()
* fBodyBodyGyroMag-mean()
* fBodyBodyGyroMag-std()
* fBodyBodyGyroJerkMag-mean()
* fBodyBodyGyroJerkMag-std()
* angle(tBodyAccMean,gravity)
* angle(tBodyAccJerkMean),gravityMean)
* angle(tBodyGyroMean,gravityMean)
* angle(tBodyGyroJerkMean,gravityMean)
* angle(X,gravityMean)
* angle(Y,gravityMean)
* angle(Z,gravityMean)
