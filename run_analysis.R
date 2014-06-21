# Merges the wearable training and the test sets to create one data set
# on the measurements on the mean and standard deviation for each measurement. 
# Uses descriptive activity names to name the activities in the data set
# Appropriately labels the data set with descriptive variable names. 

getTidyData <- function(directory=""){
  ##Files
  if(directory==""){
    strDir <-paste(directory, "UCI HAR Dataset/",sep="")
  }else{
    strDir <-paste(directory, "/UCI HAR Dataset/",sep="")
  }
  activity_labels_read<-read.table( paste(strDir, "activity_labels.txt", sep=""), header = F)
  colnames(activity_labels_read) <- c("#","Activity")
  features_read<-read.table(paste(strDir, "features.txt", sep=""), header = F)
  
  ##Train
  subject_train_read <- read.table( paste(strDir, "train/subject_train.txt", sep=""), header = F) #subject number to observation
  X_train_read <- read.table( paste(strDir, "train/X_train.txt", sep=""), header = F) #data set
  y_train_read <- read.table( paste(strDir, "train/y_train.txt", sep=""), header = F) #activity type number to data
  
  ##Test
  subject_test_read <- read.table( paste(strDir, "test/subject_test.txt", sep=""), header = F) #subject number to observation
  X_test_read <- read.table( paste(strDir, "test/X_test.txt", sep=""), header = F) #data set
  y_test_read <- read.table( paste(strDir, "test/y_test.txt", sep=""), header = F) #activity type number to data
  
  ##merged
  merged_data_set<-rbind(X_test_read, X_train_read) #training and test data
  colnames(merged_data_set) <- features_read$V2 # set col names
  merged_activity_nums<-rbind(y_test_read, y_train_read) #merge the activity nums
  colnames(merged_activity_nums)<-c("Activity") # set the column name 
  merged_subject_nums<-rbind(subject_test_read, subject_train_read) #merge the subject nums
  
  ##subset variable columns - only means and standard deviations
  data_set_mn<- merged_data_set[,grepl("mean()", colnames(merged_data_set), fixed=T)]
  data_set_sd<-merged_data_set[,grepl("std()", colnames(merged_data_set), fixed=T)]
  
  ##make factors from labels and activity numbers to form descrptive activity names for data
  actLevels <- factor(activity_labels_read$Activity)
  actLabels<-factor(merged_activity_nums$Activity, labels = actLevels)
  
  ##merge all rows and rename columns for descriptive variables
  complete_data<-cbind(merged_subject_nums, actLabels, data_set_mn, data_set_sd)
  colnames(complete_data)<-c("SubjectNumber", "Activity", colnames(data_set_mn), colnames(data_set_sd))
  complete_data
}


##pass in complete_data to get...

mean_complete_data<-function(complete_data){
  #takes data set from other function and creates tidy data set the average of each variable 
  #for each activity and each subject. 
  meanDataSet<-aggregate(.~SubjectNumber+Activity, FUN=mean, data=complete_data)

}

#Write a data file into working directory
write_data<-function(data){
  write.table(data, file="a_complete_data.csv", sep=",", col.names=T)
}
