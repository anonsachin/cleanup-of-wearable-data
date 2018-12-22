## HIS IS A CLEAN UP SOME WEARABLE DATA 

This is the link to the actual data:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

IT has been cleaned up with descriptive column names and selection of the usefulinformation.

Information collected from a Samsung Galaxy S2

for full description of the information look here:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

# The steps are -
1. Get the script of the repo
2. move into a new folder on R/R studio
3. then run the script
4. You will get a document named tidy.txt with the tidy data

# Clean up process
 1.The zip is downloaded and unzipped
 2. The training datsset is extracted from the train folder from the X_train document, similarly the for the test dataset
 3. It is then merged into a single dataset using "rbind" function
 4. Then the mean terms are extracted.
 5. After that extracted data frame is looped over per participant and per activity to calculate the mean of each mean variable.
6. Then the columns are renamed and writen to the file
 
