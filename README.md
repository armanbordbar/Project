## Human Activity Recognition

###The presented script is created to make a tidy dataset from an initial dataset which refers to the measurements of different featurs collected during a reseach on Human Activity Recognition using smartphones. A group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity.
###In summery the collected featurs are according to 561 different parameters such as average and standard deviation of body accelaration during an activity like walking and so on.

## How does script works?

###First it reads and saves the text files from Samsung folder, actLab for Activity Lables, feat for feature's names, test.act for the list of activities measured during experiments represented in numbers, test.sub for the list of different subjects participated  in the experiments represented by numbers, test.var for the values obtained from experiments due to each subject and each activity according to the features of the measurments.

###l1 holds the number of values for all the subjects table1 creats a matrix with one column and l1 rows with the name Subject to create the first column of the final tidy dataset. table2 now has also the activity numbers for holding test.act values. l2 hold the number of all features by counting that in test.var The for loop adds step by step the rest of columns for the  final tidy dataset We convert the final matrix of the test dataset values with subjects and activities to a dataframe called table.test.

###Then we unify the test and train datasets together and save them in a dataframe called "datase". Then we add a header to our resulted dataset consisted of the names of the features.

###Now we save the name of features in a variable called "names" or further select the features with mean and std parameters we select just the mean variables which have also a std equivalent. We then combine the two vectors for mean and std for further extract the desired variable from the dataset and save in "datasetsub1", datasetsub2 hold the datasetsub1 but in a sorted manner according to the value "Subject" The for loop serves to substitute the activity numbers with their equivalent lable in "actLab".
#The resulting dataset is the final tidy data set saved in "dataset.tidy"

###At last we use the ddply function to group the tidy dataset according to the "Subject" and "Activity" variable and then we summerize the tidy dataset by the average of each feature for each subject according to each activity.

## Code Book

###There are signals which were used to estimate variables of the feature vector for each pattern: '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

###tBodyAcc-XYZ
###tGravityAcc-XYZ
###tBodyAccJerk-XYZ
###tBodyGyro-XYZ
###tBodyGyroJerk-XYZ
###tBodyAccMag
###tGravityAccMag
###tBodyAccJerkMag
###tBodyGyroMag
###tBodyGyroJerkMag
###fBodyAcc-XYZ
###fBodyAccJerk-XYZ
###fBodyGyro-XYZ
###fBodyAccMag
###fBodyAccJerkMag
###fBodyGyroMag
###fBodyGyroJerkMag

###In the intermediate dataset, two variables (Mean - mean() value and Standard deviation - std()) are estimated from the above signals while in the basic dataset the number of variable were 22. In my intermediate dataset I have chosen all the mean values which have a corrisponding std value so in the eand we have 66 variables.

###In the final tidy dataset each of our variable are the average of all values for that variable per each subject and each activity.

###We have a variable "Subject" where each subject is represented by a number and a variable "Activity" which corrispond to the name of each activity measured in experiment.

