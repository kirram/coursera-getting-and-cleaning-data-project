run_analysis.R<-function(){
  
  library(plyr)
  
  ### Read Data ###
  
  train_data_X<-read.table("c:/Users/Kukurill/Documents/GitHub/ManagingData/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt")
  train_data_Y<-read.table("c:/Users/Kukurill/Documents/GitHub/ManagingData/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/y_train.txt")
  subject_train<-read.table("c:/Users/Kukurill/Documents/GitHub/ManagingData/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt")
  
  test_data_X<-read.table("c:/Users/Kukurill/Documents/GitHub/ManagingData/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt")
  test_data_Y<-read.table("c:/Users/Kukurill/Documents/GitHub/ManagingData/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt")
  subject_test<-read.table("c:/Users/Kukurill/Documents/GitHub/ManagingData/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt")
  
  ### X data set
  
  x_data <- rbind(train_data_X, test_data_X)
  
  ### y data set
  y_data <- rbind(train_data_Y, test_data_Y)
  
  ### Subject data set
  subject_data <- rbind(subject_train, subject_test)
  
  ### Read Features
  
  features<-read.table("c:/Users/Kukurill/Documents/GitHub/ManagingData/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/features.txt")
  
  ### Get means and Standard deviations
  
  MS<-grep("-(mean|std)\\(\\)", features[, 2])
  x_data <- x_data[, MS]
  names(x_data) <- features[MS, 2]
  
  ### Read Activities
  
  activities<-read.table("c:/Users/Kukurill/Documents/GitHub/ManagingData/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/activity_labels.txt")
  y_data[, 1] <- activities[y_data[, 1], 2]
  names(y_data) <- "activity"
  
  ### label the data
  
  names(subject_data) <- "subject"
  
  all_data <- cbind(x_data, y_data, subject_data)
  
  ### Create a second, independent tidy data set with the average of each variable
  
  tidy_data <- ddply(all_data, .(subject, activity), function(x) colMeans(x[, 1:66]))
  
  write.table(tidy_data, "c:/Users/Kukurill/Documents/GitHub/ManagingData/tidy_data.txt", row.name=FALSE)
  
  
  
  
}