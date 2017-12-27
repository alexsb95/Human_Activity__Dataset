
## Clean the labels names
cleanLabels <- function(pLabel_codes){
  ## Filename
  file_activity_label <- "UCI HAR Dataset/activity_labels.txt"
  
  ## Data
  activity_label <- scan(file_activity_label, character(), quote = "")
  
  ## Remove the numbers of the vector
  clean_label <- character()
  for (labels in activity_label) {
    if(grepl("^(([A-Z]|[_])+).*$",labels)){
      clean_label = c(clean_label,labels)
    }
  }
  
  ## Match the labels with their names
  result <- character()
  for (codes in pLabel_codes) {
    result = c(result, clean_label[codes])
  }
 
  return(result)
}

## Read the test data and creates a data set
readTest <- function(){
  
  filepath_General <- "UCI HAR Dataset/test/"
  filepath_Signals <- paste(filepath_General,"Inertial Signals/", sep = "")
  
  ## Check if the filepath exist
  if(!file.exists("UCI HAR Dataset/test") || !file.exists("UCI HAR Dataset/test/Inertial Signals"))
  {
    stop("ERROR: Invalid filepath_Signals")
  }
  
  ## Filenames
  file_body_acc_x <- paste(filepath_Signals,"body_acc_x_test.txt", sep = "")
  file_body_acc_y <- paste(filepath_Signals,"body_acc_y_test.txt", sep = "")
  file_body_acc_z <- paste(filepath_Signals,"body_acc_z_test.txt", sep = "")
  
  file_body_gyro_x <- paste(filepath_Signals,"body_gyro_x_test.txt", sep = "")
  file_body_gyro_y <- paste(filepath_Signals,"body_gyro_y_test.txt", sep = "")
  file_body_gyro_z <- paste(filepath_Signals,"body_gyro_z_test.txt", sep = "")
  
  file_total_acc_x <- paste(filepath_Signals,"total_acc_x_test.txt", sep = "")
  file_total_acc_y <- paste(filepath_Signals,"total_acc_y_test.txt", sep = "")
  file_total_acc_z <- paste(filepath_Signals,"total_acc_z_test.txt", sep = "")
  
  
  file_subject <- paste(filepath_General,"subject_test.txt", sep = "")
  file_variable_set <- paste(filepath_General,"X_test.txt", sep = "")
  file_activity_code <- paste(filepath_General,"y_test.txt", sep = "")
  

  
  ## Data
  body_acc_x <- read.table(file_body_acc_x) 
  body_acc_y <- read.table(file_body_acc_y) 
  body_acc_z <- read.table(file_body_acc_z) 
  
  body_gyro_x <- read.table(file_body_gyro_x)
  body_gyro_y <- read.table(file_body_gyro_y)
  body_gyro_z <- read.table(file_body_gyro_z)
  
  total_acc_x <- read.table(file_total_acc_x)
  total_acc_y <- read.table(file_total_acc_y)
  total_acc_z <- read.table(file_total_acc_z)


  subject <- scan(file_subject, numeric())
  variable_set <- scan(file_variable_set, numeric())
  activity_code <- scan(file_activity_code, numeric())
  
  # Cleaning data
  body_acc_x_mean <- apply(body_acc_x, 1,mean); body_acc_x_sd <- apply(body_acc_x, 1,sd)
  body_acc_y_mean <- apply(body_acc_y, 1,mean); body_acc_y_sd <- apply(body_acc_y, 1,sd)
  body_acc_z_mean <- apply(body_acc_z, 1,mean); body_acc_z_sd <- apply(body_acc_z, 1,sd)
  
  body_gyro_x_mean <- apply(body_gyro_x, 1,mean); body_gyro_x_sd <- apply(body_gyro_x, 1,sd)
  body_gyro_y_mean <- apply(body_gyro_y, 1,mean); body_gyro_y_sd <- apply(body_gyro_y, 1,sd)
  body_gyro_z_mean <- apply(body_gyro_z, 1,mean); body_gyro_z_sd <- apply(body_gyro_z, 1,sd)
  
  total_acc_x_mean <- apply(total_acc_x, 1,mean); total_acc_x_sd <- apply(total_acc_x, 1,sd)
  total_acc_y_mean <- apply(total_acc_y, 1,mean); total_acc_y_sd <- apply(total_acc_y, 1,sd)
  total_acc_z_mean <- apply(total_acc_z, 1,mean); total_acc_z_sd <- apply(total_acc_z, 1,sd)
  
  activity_label <- cleanLabels(activity_code)
  
  ## Create data frame
  data.frame(variable_set, activity_label, subject, 
             body_acc_x_mean, body_acc_x_sd, body_acc_y_mean, body_acc_y_sd, body_acc_z_mean, body_acc_z_sd, 
             body_gyro_x_mean, body_gyro_x_sd, body_gyro_y_mean, body_gyro_y_sd, body_gyro_z_mean, body_gyro_z_sd,
             total_acc_x_mean, total_acc_x_sd, total_acc_y_mean, total_acc_y_sd, total_acc_z_mean, total_acc_z_sd)
  
}

## Read the test data and creates a data set
readTrain <- function(){
  
  filepath_General <- "UCI HAR Dataset/train/"
  filepath_Signals <- paste(filepath_General,"Inertial Signals/", sep = "")
  
  ## Check if the filepath exist
  if(!file.exists("UCI HAR Dataset/train") || !file.exists("UCI HAR Dataset/train/Inertial Signals"))
  {
    stop("ERROR: Invalid filepath_Signals")
  }
  
  ## Filenames
  file_body_acc_x <- paste(filepath_Signals,"body_acc_x_train.txt", sep = "")
  file_body_acc_y <- paste(filepath_Signals,"body_acc_y_train.txt", sep = "")
  file_body_acc_z <- paste(filepath_Signals,"body_acc_z_train.txt", sep = "")
  
  file_body_gyro_x <- paste(filepath_Signals,"body_gyro_x_train.txt", sep = "")
  file_body_gyro_y <- paste(filepath_Signals,"body_gyro_y_train.txt", sep = "")
  file_body_gyro_z <- paste(filepath_Signals,"body_gyro_z_train.txt", sep = "")
  
  file_total_acc_x <- paste(filepath_Signals,"total_acc_x_train.txt", sep = "")
  file_total_acc_y <- paste(filepath_Signals,"total_acc_y_train.txt", sep = "")
  file_total_acc_z <- paste(filepath_Signals,"total_acc_z_train.txt", sep = "")
  
  
  file_subject <- paste(filepath_General,"subject_train.txt", sep = "")
  file_variable_set <- paste(filepath_General,"X_train.txt", sep = "")
  file_activity_code <- paste(filepath_General,"y_train.txt", sep = "")
  
  
  
  ## Data
  body_acc_x <- read.table(file_body_acc_x) 
  body_acc_y <- read.table(file_body_acc_y) 
  body_acc_z <- read.table(file_body_acc_z) 
  
  body_gyro_x <- read.table(file_body_gyro_x)
  body_gyro_y <- read.table(file_body_gyro_y)
  body_gyro_z <- read.table(file_body_gyro_z)
  
  total_acc_x <- read.table(file_total_acc_x)
  total_acc_y <- read.table(file_total_acc_y)
  total_acc_z <- read.table(file_total_acc_z)
  
  
  subject <- scan(file_subject, numeric())
  variable_set <- scan(file_variable_set, numeric())
  activity_code <- scan(file_activity_code, numeric())
  
  # Cleaning data
  body_acc_x_mean <- apply(body_acc_x, 1,mean); body_acc_x_sd <- apply(body_acc_x, 1,sd)
  body_acc_y_mean <- apply(body_acc_y, 1,mean); body_acc_y_sd <- apply(body_acc_y, 1,sd)
  body_acc_z_mean <- apply(body_acc_z, 1,mean); body_acc_z_sd <- apply(body_acc_z, 1,sd)
  
  body_gyro_x_mean <- apply(body_gyro_x, 1,mean); body_gyro_x_sd <- apply(body_gyro_x, 1,sd)
  body_gyro_y_mean <- apply(body_gyro_y, 1,mean); body_gyro_y_sd <- apply(body_gyro_y, 1,sd)
  body_gyro_z_mean <- apply(body_gyro_z, 1,mean); body_gyro_z_sd <- apply(body_gyro_z, 1,sd)
  
  total_acc_x_mean <- apply(total_acc_x, 1,mean); total_acc_x_sd <- apply(total_acc_x, 1,sd)
  total_acc_y_mean <- apply(total_acc_y, 1,mean); total_acc_y_sd <- apply(total_acc_y, 1,sd)
  total_acc_z_mean <- apply(total_acc_z, 1,mean); total_acc_z_sd <- apply(total_acc_z, 1,sd)
  
  activity_label <- cleanLabels(activity_code)
  
  ## Create data frame
  data.frame(variable_set, activity_label, subject, 
             body_acc_x_mean, body_acc_x_sd, body_acc_y_mean, body_acc_y_sd, body_acc_z_mean, body_acc_z_sd, 
             body_gyro_x_mean, body_gyro_x_sd, body_gyro_y_mean, body_gyro_y_sd, body_gyro_z_mean, body_gyro_z_sd,
             total_acc_x_mean, total_acc_x_sd, total_acc_y_mean, total_acc_y_sd, total_acc_z_mean, total_acc_z_sd)
  
}

## Merges the two data set
main <- function(){
  test_DataSet <- readTest()
  train_DataSet <- readTrain()
  
  rbind(test_DataSet, train_DataSet) 
}
