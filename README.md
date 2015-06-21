Getting and Cleaning Data Course Project
----------------------------------------
Introduction:
-------------

The purpose of this script is to take several data tables from a dataset and combine them into one independent, tidy data frame which can then be used for further analysis. The data used is described by its creators as follows:

	Abstract: Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.
	
The data was randomly partitioned by the experimenters into two sets. 70% of the volunteers were selected for generating the training data, and 30% the test data. Each record has information about the subject, the activity, and a vector of features obtained by calculating variables from the time and frequency domain.

More information about the data set: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The Script:
-----------

First the script checks to see if there is a "data" folder in the working directory, and if not, it creates one. It then downloads the complete data set archive, and extracts it. A variable name, readPath, is assigned the path of the folder where the extracted data is.

The tables that will be combined (the test and training sets of activity, subject, and features) are read and assigned descriptive variable names.

Next, the test and training data are merged for activity, subject, and features using rbind. Names are assigned to the variables in these table. 

The 3 tables from the previous step are now combined into one table. First, the subject and activity tables are combined. Then, this resulting table is combined with the features table. A subset of this table is taken to extract only the measurements of the mean and standard deviation.

Next, descriptive activity names to name the activities in the data set are assigned using activity_labels.txt from the downloaded archive. Substitutions are made for clarity where necessary.

Finally, using the plyr package, a new, independent, tidy data set is created and outputted to the file "tidydata.txt".










