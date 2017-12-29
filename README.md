# Human_Activity__Dataset
## Content
  * The file used to make the data set , located in the "UCI HAR Dataset" folder
  * The cookbook explain the variables, located in "Codebook.md"
  * The script that used to create the tidy data, called "run_analysis.R"
  * Tidy data with the average of each variable for each activity and each subject, called "tidyData.txt"
  
## Steps for the analysis
   * Extraxt the following files to create the test and train data set:
     * subject_(...).txt
     * X_(...).txt
     * y_(...).txt
     * activity_labels.txt
     * features.txt
  * Matches the activity labels with the codes with the activity codes.   
  * Uses the features to extracts only the measurements on the mean and standard deviation for each measurement.
  * Merges the training and the test sets to create one data set.
  * Creates a second, independent tidy data set with the average of each variable for each activity and each subject export to a txt file.
