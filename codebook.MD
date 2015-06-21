Initial source of data:
-----------------------
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Files extracted from dataset:
-----------------------------
[1] "activity_labels.txt"                         
[2] "features_info.txt"                           
[3] "features.txt"                                
[4] "README.txt"                                  
[5] "test/Inertial Signals/body_acc_x_test.txt"   
[6] "test/Inertial Signals/body_acc_y_test.txt"   
[7] "test/Inertial Signals/body_acc_z_test.txt"   
[8] "test/Inertial Signals/body_gyro_x_test.txt"  
[9] "test/Inertial Signals/body_gyro_y_test.txt"  
[10] "test/Inertial Signals/body_gyro_z_test.txt"  
[11] "test/Inertial Signals/total_acc_x_test.txt"  
[12] "test/Inertial Signals/total_acc_y_test.txt"  
[13] "test/Inertial Signals/total_acc_z_test.txt"  
[14] "test/subject_test.txt"                       
[15] "test/X_test.txt"                             
[16] "test/y_test.txt"                             
[17] "train/Inertial Signals/body_acc_x_train.txt" 
[18] "train/Inertial Signals/body_acc_y_train.txt" 
[19] "train/Inertial Signals/body_acc_z_train.txt" 
[20] "train/Inertial Signals/body_gyro_x_train.txt"
[21] "train/Inertial Signals/body_gyro_y_train.txt"
[22] "train/Inertial Signals/body_gyro_z_train.txt"
[23] "train/Inertial Signals/total_acc_x_train.txt"
[24] "train/Inertial Signals/total_acc_y_train.txt"
[25] "train/Inertial Signals/total_acc_z_train.txt"
[26] "train/subject_train.txt"                     
[27] "train/X_train.txt"                           
[28] "train/y_train.txt"

Files used:
-----------
test/subject_test.txt
test/X_test.txt
test/y_test.txt
train/subject_train.txt
train/X_train.txt
train/y_train.txt
features.txt
activity.txt

Tables names and sources:
-------------------------
activityTestData <- "Y_test.txt" 
activityTrainData <- "Y_train.txt"
subjectTestData <- "subject_test.txt"
subjectTrainData <- "subject_train.txt"
featuresTestData <- "X_test.txt"
featuresTrainData <- "X_train.txt"

Descriptive variable names given to features variables:
---------------------------------
"^t" -> "time"
"^f" -> "frequency"
"Acc" -> "accelerometer"
"Gyro" -> "gyroscope"
"Mag" -> "magnitude"
"BodyBody" -> "body"

Training and Test tables merged
-------------------------------

subjectData <- subjectTrainData, subjectTestData
activityData <- activityTrainData, activityTestData
featuresData <- featuresTrainData, featuresTestData

Subject, Activity, and Features tables merged
---------------------------------------------

data <- subjectData, activityData, featuresData
'data.frame':   10299 obs. of  68 variables

newData is data frame of mean and standand deviations with descriptive variable names

