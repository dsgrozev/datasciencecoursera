# datasciencecoursera

This is Getting and Cleaning Data Course Project file upload.

The file run_analysis.R contains 1 function - run_analysis()

The function does:

1. Reads all data sets from the supplied data files;
2. Changes the column name to features name;
3. Adds subject id and activity id columns;
4. Put test and train datasets together;
5. Adds activity names.
6. Selects only standard deviation and mean columns;
7. Creates new tidy data set, grouped by subject and activity with mean value of all other columns;

The columns in the resulting dataset are:

1. subjectId;
2. activity
3 - 68. Mean value of all std and mean values for this subject and activity;
