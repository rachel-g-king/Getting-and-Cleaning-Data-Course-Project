# Getting-and-Cleaning-Data-Course-Project
==================================================================
README
==================================================================
Getting and Cleaning Data
Course Project
Rachel King
11.20.17
==================================================================

The run_analysis.R script produces a tidy data set which includes averages by subject and activity type of mean and std metrics from the Human Activity Recognition Using Smartphones Dataset. 

The script executes the following steps. 

1. Downloads and unzips the data.
2. Reads in features and activities.
3. Reads in training data, labels, and subjects and joins into 1 data frame.
4. Reads in test data, labels, and subjects and joins into 1 data frame.
5. Merges the training and the test sets together to create one data set.
6. Renames the variables in the dataframe with their correct feature names.
7. Extracts the columns containing measurements of mean and standard deviation.
8. Matches the numeric activity labels with the string labels from the activity_labels data set. 
9. Removes problematic characters from variable names.
10. Calculates mean across numeric columns for each subject/activity grouping. 
11. Outputs the resulting data set to the tidyData.txt file. 

==================================================================
Codebook
==================================================================

The tidy data set includes averages by subject and activity type of mean and std metrics from the Human Activity Recognition Using Smartphones Dataset. 

For each grouping of subject and activity the following variables are included. 
======================================

activity:  WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING

subject:   Integers 1-30 representing one of the 30 participants in the activity study. 

And averages of the following across all measurments taken for each combination of activity and subject.  

tBodyAccmeanX  		     tBodyAccmeanY               
tBodyAccmeanZ                tBodyAccstdX                 tBodyAccstdY                 tBodyAccstdZ                
tGravityAccmeanX             tGravityAccmeanY             tGravityAccmeanZ             tGravityAccstdX             
tGravityAccstdY              tGravityAccstdZ              tBodyAccJerkmeanX            tBodyAccJerkmeanY           
tBodyAccJerkmeanZ            tBodyAccJerkstdX             tBodyAccJerkstdY             tBodyAccJerkstdZ            
tBodyGyromeanX               tBodyGyromeanY               tBodyGyromeanZ               tBodyGyrostdX               
tBodyGyrostdY                tBodyGyrostdZ                tBodyGyroJerkmeanX           tBodyGyroJerkmeanY          
tBodyGyroJerkmeanZ           tBodyGyroJerkstdX            tBodyGyroJerkstdY            tBodyGyroJerkstdZ           
tBodyAccMagmean              tBodyAccMagstd               tGravityAccMagmean           tGravityAccMagstd           
tBodyAccJerkMagmean          tBodyAccJerkMagstd           tBodyGyroMagmean             tBodyGyroMagstd             
tBodyGyroJerkMagmean         tBodyGyroJerkMagstd          fBodyAccmeanX                fBodyAccmeanY               
fBodyAccmeanZ                fBodyAccstdX                 fBodyAccstdY                 fBodyAccstdZ                
fBodyAccmeanFreqX            fBodyAccmeanFreqY            fBodyAccmeanFreqZ            fBodyAccJerkmeanX           
fBodyAccJerkmeanY            fBodyAccJerkmeanZ            fBodyAccJerkstdX             fBodyAccJerkstdY            
fBodyAccJerkstdZ             fBodyAccJerkmeanFreqX        fBodyAccJerkmeanFreqY        fBodyAccJerkmeanFreqZ       
fBodyGyromeanX               fBodyGyromeanY               fBodyGyromeanZ               fBodyGyrostdX               
fBodyGyrostdY                fBodyGyrostdZ                fBodyGyromeanFreqX           fBodyGyromeanFreqY          
fBodyGyromeanFreqZ           fBodyAccMagmean              fBodyAccMagstd               fBodyAccMagmeanFreq         
fBodyBodyAccJerkMagmean      fBodyBodyAccJerkMagstd       fBodyBodyAccJerkMagmeanFreq  fBodyBodyGyroMagmean        
fBodyBodyGyroMagstd          fBodyBodyGyroMagmeanFreq     fBodyBodyGyroJerkMagmean     fBodyBodyGyroJerkMagstd     
fBodyBodyGyroJerkMagmeanFreq
