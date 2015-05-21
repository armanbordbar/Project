# Reading and saving the text files from Samsung folder,
# actLab for Activity Lables, feat for feature's names, test.act
# for the list of activities measured during experiments represented
# in numbers, test.sub for the list of different subjects participated 
# in the experiments represented by numbers, test.var for the values
# obtained from experiments due to each subject and each activity 
# according to the features of the measurments.
actLab <- read.table("./UCI HAR Dataset/activity_labels.txt")
feat <- read.table("./UCI HAR Dataset/features.txt")
test.act <- read.table("./UCI HAR Dataset/test/y_test.txt")
test.sub <- read.table("./UCI HAR Dataset/test/subject_test.txt")
test.var <- read.table("./UCI HAR Dataset/test/X_test.txt")
#l1 holds the number of values for all the subjects
#table1 creats a matrix with one column and l1 rows
#with the name Subject to create the first column of the final
#tidy dataset.
#table2 now has also the activity numbers for holding test.act
#values.
#l2 hold the number of all features by counting that in test.var
#The for loop adds step by step the rest of columns for the 
#final tidy dataset
#We convert the final matrix of the test dataset values with 
#subjects and activities to a dataframe called table.test.  
l1 <- length(test.var[[1]])
table1 <- matrix(test.sub[[1]][1:l1], nrow = l1, ncol = 1)
table2 <- cbind(table1,test.act[[1]][1:l1])
l2 <- length(test.var)
for (i in 1 : l2)
{
        table2 <- cbind(table2,test.var[[i]][1:l1])
        
}
table.test <- data.frame(table2)

rm(table2)
train.act <- read.table("./UCI HAR Dataset/train/y_train.txt")
train.sub <- read.table("./UCI HAR Dataset/train/subject_train.txt")
train.var <- read.table("./UCI HAR Dataset/train/X_train.txt")
l1 <- length(train.var[[1]])
table1 <- matrix(train.sub[[1]][1:l1], nrow = l1, ncol = 1)
table2 <- cbind(table1,train.act[[1]][1:l1])
l2 <- length(train.var)
for (i in 1 : l2)
{
        table2 <- cbind(table2,train.var[[i]][1:l1])
        
}
table.train <- data.frame(table2)
#We unify the test and train datasets together and save them
#in a dataframe called "datase".
#Then we add a header to our resulted dataset consisted of the
#names of the features
dataset <- rbind(table.test,table.train)
names(dataset) <- c("Subject","Activity",as.character(feat$V2))
#Now we save the name of features in a variable called "names"
#for further select the features with mean and std parameters
#we select just the mean variables which have also a std equivalent.
#We then combine the two vectors for mean and std for further extract
#the desired variable from the dataset and save in "datasetsub1",
#datasetsub2 hold the datasetsub1 but in a sorted manner according
#to the value "Subject"
#The for loop serves to substitute the activity numbers with
#their equivalent lable in "actLab".
#The resulting dataset is the final tidy data set saved in
#"dataset.tidy"
names <- names(dataset)
subset1 <- names[grepl("mean()", names, fixed = TRUE)]
subset2 <- names[grepl("std()", names, fixed = TRUE)]
subset <- c(subset1,subset2)
datasetsub1 <- subset(dataset, select = c("Subject", "Activity", subset2))
datasetsub2 <- arrange(datasetsub, Subject)
for (i in 1:6)
{
        datasetsub2$Activity[datasetsub2$Activity == i] <- as.character(actLab$V2[i]) 
}
dataset.tidy <- datasetsub2
#At last we use the ddply function to group the tidy dataset
#according to the "Subject" and "Activity" variable and then
#we summerize the tidy dataset by the average of each feature 
#for each subject according to each activity
ddply(datasetsub2,.(Subject, Activity),numcolwise(mean,na.rm = TRUE))
