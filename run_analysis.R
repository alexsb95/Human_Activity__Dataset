## Substitute the activity codes for it's label
getLabels <- function(pLabel_codes){
  ## Read the file
  file_activity_label <- "UCI HAR Dataset/activity_labels.txt"
  activity_label <- scan(file_activity_label, character(), quote = "")
  
  ## Remove the numbers of the vector, leaves the names only
  index_bool <- grepl("^(([A-Z]|[_])+).*$",activity_label)
  activity_label <- activity_label[index_bool]
  
  ## Match the labels with their names
  result <- character()
  for (codes in pLabel_codes) {
    result = c(result, activity_label[codes])
  }
  
  return(result)
}

## Get the mean and the std from the mesurement
getFeatures <- function(pMeasurement){
  ## Read the file
  file_features <-"UCI HAR Dataset/features.txt"
  features <- read.table(file_features) 
  
  index <- grep("^.*(-(std|mean)[(][)])+.*$",features$V2)
  result <- pMeasurement[,index]
  colnames(result) <- features[index,2]
  
  return(result)
}

## Read the test data and creates a data set
createDataSet <- function(pFile){
  ## Reading files
  subject <- scan(pFile$file_subject, numeric())
  measurement  <- read.table(pFile$file_measurement) 
  activity_code <- scan(pFile$file_activity_code, numeric())

  
  # Cleaning data
  
  activity_label <- getLabels(activity_code)
  measurement <- getFeatures(measurement)
  
  ## Create data frame
  data.frame(subject, activity_label, measurement)
  
}


## Merges the two data set
main <- function(){

  ## Check if the filepath exist
  if(!file.exists("UCI HAR Dataset/test") || !file.exists("UCI HAR Dataset/train"))
  {
    stop("ERROR: Invalid filepath_Signals")
  }
  
  ## TEST
  
  filepath_General_test <- "UCI HAR Dataset/test/"
  file_subject_test <- paste(filepath_General_test,"subject_test.txt", sep = "")
  file_measurement_test <- paste(filepath_General_test,"X_test.txt", sep = "")
  file_activity_code_test <- paste(filepath_General_test,"y_test.txt", sep = "")
  
  testFiles <- data.frame(file_subject_test, file_measurement_test, file_activity_code_test, stringsAsFactors=FALSE)
  
  test_DataSet <- createDataSet(testFiles)
  
  ## TRAIN
  
  filepath_General_train <- "UCI HAR Dataset/train/"
  file_subject_train <- paste(filepath_General_train,"subject_train.txt", sep = "")
  file_measurement_train <- paste(filepath_General_train,"X_train.txt", sep = "")
  file_activity_code_train <- paste(filepath_General_train,"y_train.txt", sep = "")
  trainFiles <- data.frame(file_subject_train, file_measurement_train, file_activity_code_train, stringsAsFactors=FALSE)
   
  train_DataSet <- createDataSet(trainFiles)
  
  
  ##Combine the data set
  rbind(test_DataSet, train_DataSet) 
}

tidy_DataSet

#aggregate


