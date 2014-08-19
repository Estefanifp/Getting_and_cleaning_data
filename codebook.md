## Getting and Cleaning Data - Course Project
***

###Code Book
***

Explains the contents of **tidydata.txt**, its data, variables and any performed transformations.

### Data Source
***
* Original data: Human Activity Recognition Using Smartphones Dataset,Version 1.0.
<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>
        
* Original data description: <http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>.

### Final Data 
***

A txt file named **"tidydata.txt"**, with dimmensions: 181 rows (including a header) and 81 variables with the average of each variable for each activity and each subject.

Suggestion to read: ```read.table ("tidydata.txt", sep = ",", header = TRUE)```.

Originally there were two data sets: 

* "data/UCI HAR Dataset/train/X_train.txt" : Training set.

* "data/UCI HAR Dataset/test/X_test.txt" : Test set.

They have been merged using ```rbind()```; I also added the correspondent labels: features, and two columns: subjects and activities (more info in "Variables" next).

### Variables
***
In the original data there were a 561-feature vector with time and frequency domain variables, in the **tidydata.txt** I reduced the variables down to 81 (according to instructions) extracting only the measurements on the mean and standard deviation for each measurement.I added 2 columns: 

* "subjectID" : Subject who performed the activity, numbers from 1 to 30.

* "activity" : Descriptive activity label:

        + WALKING
        + WALKING_UPSTAIRS
        + WALKING_DOWNSTAIRS
        + SITTING
        + STANDING
        + LAYING

**Original (extracted) names of the  variables and new descriptive names:**
The names were written using Upper case for the first letter of each word to improve readability due to the length. Next I present the changes made:

 Tidydata Name | Original Name
------------- | ------------- 
time | t (Placed at the beggining)
frequency | f (Placed at the beggining)
Acceleration | ACC
(nothing) | -
(nothing) | ()
Mean | mean
StandardDeviation | std
Gyroscope | Gyro
Magnitude | Mag
Body | BodyBody

Examples:

* "tBodyAcc-mean()-X" to "timeBodyAccelerationMeanX".

* "fBodyBodyGyroMag-std()" to "frequencyBodyGyroscopeMagnitudeStandardDeviation".

**List of all variables:**

 [1] "subjectID"                                              
 [2] "activity"                                               
 [3] "timeBodyAccelerationMeanX"                              
 [4] "timeBodyAccelerationMeanY"                              
 [5] "timeBodyAccelerationMeanZ"                              
 [6] "timeBodyAccelerationStandardDeviationX"                 
 [7] "timeBodyAccelerationStandardDeviationY"                 
 [8] "timeBodyAccelerationStandardDeviationZ"                 
 [9] "timeGravityAccelerationMeanX"                           
[10] "timeGravityAccelerationMeanY"                           
[11] "timeGravityAccelerationMeanZ"                           
[12] "timeGravityAccelerationStandardDeviationX"              
[13] "timeGravityAccelerationStandardDeviationY"              
[14] "timeGravityAccelerationStandardDeviationZ"              
[15] "timeBodyAccelerationJerkMeanX"                          
[16] "timeBodyAccelerationJerkMeanY"                          
[17] "timeBodyAccelerationJerkMeanZ"                          
[18] "timeBodyAccelerationJerkStandardDeviationX"             
[19] "timeBodyAccelerationJerkStandardDeviationY"             
[20] "timeBodyAccelerationJerkStandardDeviationZ"             
[21] "timeBodyGyroscopeMeanX"                                 
[22] "timeBodyGyroscopeMeanY"                                 
[23] "timeBodyGyroscopeMeanZ"                                 
[24] "timeBodyGyroscopeStandardDeviationX"                    
[25] "timeBodyGyroscopeStandardDeviationY"                    
[26] "timeBodyGyroscopeStandardDeviationZ"                    
[27] "timeBodyGyroscopeJerkMeanX"                             
[28] "timeBodyGyroscopeJerkMeanY"                             
[29] "timeBodyGyroscopeJerkMeanZ"                             
[30] "timeBodyGyroscopeJerkStandardDeviationX"                
[31] "timeBodyGyroscopeJerkStandardDeviationY"                
[32] "timeBodyGyroscopeJerkStandardDeviationZ"                
[33] "timeBodyAccelerationMagnitudeMean"                      
[34] "timeBodyAccelerationMagnitudeStandardDeviation"         
[35] "timeGravityAccelerationMagnitudeMean"                   
[36] "timeGravityAccelerationMagnitudeStandardDeviation"      
[37] "timeBodyAccelerationJerkMagnitudeMean"                  
[38] "timeBodyAccelerationJerkMagnitudeStandardDeviation"     
[39] "timeBodyGyroscopeMagnitudeMean"                         
[40] "timeBodyGyroscopeMagnitudeStandardDeviation"            
[41] "timeBodyGyroscopeJerkMagnitudeMean"                     
[42] "timeBodyGyroscopeJerkMagnitudeStandardDeviation"        
[43] "frequencyBodyAccelerationMeanX"                         
[44] "frequencyBodyAccelerationMeanY"                         
[45] "frequencyBodyAccelerationMeanZ"                         
[46] "frequencyBodyAccelerationStandardDeviationX"            
[47] "frequencyBodyAccelerationStandardDeviationY"            
[48] "frequencyBodyAccelerationStandardDeviationZ"            
[49] "frequencyBodyAccelerationMeanFreqX"                     
[50] "frequencyBodyAccelerationMeanFreqY"                     
[51] "frequencyBodyAccelerationMeanFreqZ"                     
[52] "frequencyBodyAccelerationJerkMeanX"                     
[53] "frequencyBodyAccelerationJerkMeanY"                     
[54] "frequencyBodyAccelerationJerkMeanZ"                     
[55] "frequencyBodyAccelerationJerkStandardDeviationX"        
[56] "frequencyBodyAccelerationJerkStandardDeviationY"        
[57] "frequencyBodyAccelerationJerkStandardDeviationZ"        
[58] "frequencyBodyAccelerationJerkMeanFreqX"                 
[59] "frequencyBodyAccelerationJerkMeanFreqY"                 
[60] "frequencyBodyAccelerationJerkMeanFreqZ"                 
[61] "frequencyBodyGyroscopeMeanX"                            
[62] "frequencyBodyGyroscopeMeanY"                            
[63] "frequencyBodyGyroscopeMeanZ"                            
[64] "frequencyBodyGyroscopeStandardDeviationX"               
[65] "frequencyBodyGyroscopeStandardDeviationY"               
[66] "frequencyBodyGyroscopeStandardDeviationZ"               
[67] "frequencyBodyGyroscopeMeanFreqX"                        
[68] "frequencyBodyGyroscopeMeanFreqY"                        
[69] "frequencyBodyGyroscopeMeanFreqZ"                        
[70] "frequencyBodyAccelerationMagnitudeMean"                 
[71] "frequencyBodyAccelerationMagnitudeStandardDeviation"    
[72] "frequencyBodyAccelerationMagnitudeMeanFreq"             
[73] "frequencyBodyAccelerationJerkMagnitudeMean"             
[74] "frequencyBodyAccelerationJerkMagnitudeStandardDeviation"
[75] "frequencyBodyAccelerationJerkMagnitudeMeanFreq"         
[76] "frequencyBodyGyroscopeMagnitudeMean"                    
[77] "frequencyBodyGyroscopeMagnitudeStandardDeviation"       
[78] "frequencyBodyGyroscopeMagnitudeMeanFreq"                
[79] "frequencyBodyGyroscopeJerkMagnitudeMean"                
[80] "frequencyBodyGyroscopeJerkMagnitudeStandardDeviation"   
[81] "frequencyBodyGyroscopeJerkMagnitudeMeanFreq"
  
### Processing Steps / Transformations
***
1. Download the data from the original source.

2. Unzip in the directory "data" placed at the working directory.

3. Column bind the subject (```data/UCI HAR Dataset/train/subject_train.txt```), activity number (```data/UCI HAR Dataset/train/y_train.txt```) and data (```data/UCI HAR Dataset/train/X_train.txt```) for both test and train data set. *The previous files are  available for the train and test data*.

4. Merge the training and the test sets to create one data set and add columns names: "subjectID", "activity" and featuresnames (see the complete list in "variables").

5. Extract only the measurements on the mean and standard deviation for each measurement.

6. Add again the subjectid and activity.

7. Uses descriptive activity names to name the activities in the data set and defined them as factors.

8.  Appropriately label the data set with descriptive variable names.

9. Create a second, independent tidy data set with the average of each variable for each activity and each subject. 

10. Save it as "tidydata.txt".
