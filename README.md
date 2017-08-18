## Getting and Cleaning Data: Course Project
## Task Formulation
___

0. Download dataset form the [source](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

### Files in the Repository
___

The list of files related to this project are provided in the table below.

| File Name         | Description                                                   |
|-------------------|---------------------------------------------------------------|
|README.md| Describes of project and programming features to facilitate its understanding|
|CodeBook.md| Describes all variables included into the model output, their units and bouds|
|run_analysis.R| Main script file used for the raw data transformation. Its structure is described below in details|
|TidyData.txt (not included into the repository)|Contains the output dataset. This file is not in the repository, it was uploaded using the Coursera interface.|

### Script File Structure
___

The "run_analysis.R" file consists of the following parts:

0. Library including (row #1);
1. Download zip file and unzip it to working directory (rows #5 - 9);
2. Reading and merging datasets except activity names (rows #13 - 58);
3. Variable selection (rows #61 - 62);
4. Change of the variable (rows #69 - 102);
5. Merging with the activity names dataset (row #105);
6. Final dataset construction (rows #108 - 110);
7. Writing the results (rows #112 - 115).

### Notes
___

I made some notes and clarifications regarding the R script logic. Hope they will help to reviewers.

1. Script downloads _.zip_ file as a temporary file and then unzip it to working directory. If you run tis script, please choose the working directory before it to know, where the raw data files can be found;
2. In rows #45 - 50 the script checks consistency of sizes of input data. If they are not consistent, then they cannot be combined. It may be useful if datasets change in future.
3. To find numbers of columns containing "mean" and "std" variables I used the following function (row #61):

>colArray <- c(1,2,grep("mean[^F]|std", varNames$V2)+2)

3. The "mean[^F]" regular expressions exclude _meanFreq_ and _angle(<...>Mean<...>)_ variables from the sample (as I understood, they shouldn't be included). Also the first two columns are sererved by "ActivityNumber" and "SubjectNumber" variables, that's why I added 2 to each element of the _grep_ function output.
4. I found that the logic of the raw data variable names is the following: they consist of three parts: name, aggregation function and axis (if applicable). These parts are separated by "-". That is why my renaming logic was the following (see also rows #69 - 101):

    + Split the names on three (or two for magnitude variables) parts;
    + Make the name more descriptive as required in the task;
    + Slightly change other parts (remove brakets, add word "along");
    + Group these parts together.

5. I've attached output .txt file containing the tidy data set. It can be read using row #118 (currently it is commented). Also I would like to note that, despite of the tidiness, it's not useful to visually inspect .txt file (at least in my reader) due to uneven formatting. It can be fixed by making the variable names shorter, but in this case, I think, they will be as descriptive as the initial names. That's why I decided not to do it. To look at the file in a good format, the following things can be done:
    
    + Read file using row #118 and look at the content using R Studio;
    + Uncomment row #117 and generate .csv file, which doesn't have such problem.
    
### The Tidy Data Checklist
___

To verify that the final dataset is tidy, I took the tidy data conditions from the first week presentation and checked if they are met:

* Each variable you measure should be in one column (done);
* Each different observation of that variable should be in a different row (done, here "observation" is "ActivityName"+"SubjectName");
* There should be one table for each "kind" of variables (done, here there is only one "kind" of variables - sample characteristics (means and standard deviations) of processed accelerometer and gyroscope signal);
* If you have multiple tables, thay should include a column in the table that allows them to be linked (not applicable, there is only one table);
* Include a row at the top of each file with variable names (done);
* Make variable names human readable (done);
* Data should be saved in one file per table (done).
