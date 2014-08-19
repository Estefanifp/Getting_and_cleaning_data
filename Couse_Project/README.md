## Getting and Cleaning Data - Course Project
***

### Introduction
***

The present repository was created as part of the **Course Project** for **"Getting and Cleanning Data"**.

From the **"Human Activity Recognition Using Smartphones Dataset",Version 1.0** (see codebook.md for details), it was indicated to create one R script called ```run_analysis.R``` that does the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set.
4. Appropriately labels the data set with descriptive variable names. 
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 


### Files in the repository 
***

1. **README.md**  
2. **run_analysis.R** : R script that takes/downloads the raw data and returns the file **tidydata.txt**.
3. **codebook.md** : Markdown file that explains the contents of **tidydata.txt**, its data, variables and any performed transformations.
4. **tidydata.txt** : Data table with the "tidy data", according to instructions. Dimensions: 180 rows, 81 columns. Notes to read properly: sep = ",", header = TRUE.






