run_analysis <- function(dataFolder = "C:/Users/dimg/Desktop/UCI HAR Dataset") {
    
    ## read data
    setwd(dataFolder)
    X_train <- read.delim("train/X_train.txt", sep = "", header = FALSE)
    X_test <- read.delim("test/X_test.txt", sep = "", header = FALSE)
    y_train <- read.delim("train/y_train.txt", header = FALSE)
    y_test <- read.delim("test/y_test.txt", header = FALSE)
    activity_labels <- read.delim("activity_labels.txt", sep = "", 
                                  header = FALSE)
    features <- read.delim("features.txt", header = FALSE)
    subject_test <- read.delim("test/subject_test.txt", header = FALSE)
    subject_train <- read.delim("train/subject_train.txt", header = FALSE)
    
    ## change column names to features
    colnames(X_train) <- features[,1]
    colnames(X_test) <- features[,1]
    
    ## add subject column
    X_train<- cbind(X_train, subject_train)
    colnames(X_train)[562] <- "subjectId"
    X_test<- cbind(X_test, subject_test)
    colnames(X_test)[562] <- "subjectId"
    
    ## add activity column
    X_train<- cbind(X_train, y_train)
    colnames(X_train)[563] <- "activityId"
    X_test<- cbind(X_test, y_test)
    colnames(X_test)[563] <- "activityId"
    
    ## put the dataset together
    all <- rbind(X_test, X_train)
    
    ##load dplyr
    library(dplyr)
    
    ## add activity labels
    colnames(activity_labels) <- c("activityId", "activity")
    allWithActivities <- merge(all, activity_labels, by.x = "activityId", 
                               by.y = "activityId")
    
    ## select activity and subject, std(), mean(), 
    selected <- select(allWithActivities, subjectId : activity, 
                       contains("std()"), contains("mean()"))    
    
    ## create the tidy set with mean values for measurement variables 
    ## grouped by subject and activity
    
    result <- selected %>% group_by(subjectId, activity) 
                    %>% summarise_all(funs(mean))

}