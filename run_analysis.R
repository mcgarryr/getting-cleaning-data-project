## Create a directory for the data (if one does not already exist) and download.

	if(!file.exists("./data")){dir.create("./data")}
	fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
	download.file(fileUrl, destfile="./data/courseprojectdataset.zip")

## Extract data

	unzip(zipfile="./data/courseprojectdataset.zip", exdir="./data")

## List files in directory

	readPath <- file.path("./data" , "UCI HAR Dataset")
	files <- list.files(readPath, recursive=TRUE)
	files

## Assign descriptive variable names to tables (activity, subject, and features)

	activityTestData  <- read.table(file.path(readPath, "test" , "Y_test.txt" ),header = FALSE)
	activityTrainData <- read.table(file.path(readPath, "train", "Y_train.txt"),header = FALSE)
	
	subjectTestData  <- read.table(file.path(readPath, "test" , "subject_test.txt"),header = FALSE)
	subjectTrainData <- read.table(file.path(readPath, "train", "subject_train.txt"),header = FALSE)
	
	featuresTestData  <- read.table(file.path(readPath, "test" , "X_test.txt" ),header = FALSE)
	featuresTrainData <- read.table(file.path(readPath, "train", "X_train.txt"),header = FALSE)

## Merge test and train data sets for subject, activity, and features

	subjectData <- rbind(subjectTrainData, subjectTestData)
	activityData <- rbind(activityTrainData, activityTestData)
	featuresData <- rbind(featuresTrainData, featuresTestData)

## Assign names to variables

	names(subjectData)<-c("subject")
	names(activityData)<- c("activity")
	featuresDataNames <- read.table(file.path(readPath, "features.txt"),head=FALSE)
	names(featuresData)<- featuresDataNames$V2


## Merge columns into one table that contains all data	
	
	combinedData <- cbind(subjectData, activityData)
	data <- cbind(featuresData, combinedData)

##	Subset to extract only the measurements on the mean and standard deviation

	subfeaturesDataNames <- featuresDataNames$V2[grep("mean\\(\\)|std\\(\\)", featuresDataNames$V2)]
	selectedNames<-c(as.character(subfeaturesDataNames), "subject", "activity" )
	data <- subset(data,select=selectedNames)

##	Assign descriptive activity names to name the activities in the data set using activity_labels.txt from download. Make substitutions for clarity where necessary.

	activityLabels <- read.table(file.path(readPath, "activity_labels.txt"),header = FALSE)
	names(data)<-gsub("^t", "time", names(data))
	names(data)<-gsub("^f", "frequency", names(data))
	names(data)<-gsub("Acc", "accelerometer", names(data))
	names(data)<-gsub("Gyro", "gyroscope", names(data))
	names(data)<-gsub("Mag", "magnitude", names(data))
	names(data)<-gsub("BodyBody", "body", names(data))

	
	names(data)

## Use plyr package to create and output a new, independent, tidy data set.
	
	library(plyr);
	newData <- aggregate(. ~subject + activity, data, mean)
	newData <- newData[order(newData$subject,newData$activity),]
	write.table(newData, file = "tidydata.txt",row.name=FALSE)