# Modeling the new Aug files

# setting directories

getwd()
setwd("/home/asakhardhande04_sm/Aug_first_week/Aug_files")

# combinining all the xlsx files together

library(xlsx)
filenames <- list.files(pattern=".xlsx")
library(plyr)
df.list <- lapply(filenames, function(x) read.xlsx(file=x, sheetIndex=1,
                                                   colIndex=1:11,as.data.frame=TRUE, header=FALSE, FILENAMEVAR=x))
final.df <- rbind.fill(df.list)
nrow(final.df)

# Writing the file to a disk

setwd("/home/asakhardhande04_sm/Aug_first_week")
write.csv(final.df, file = "TC_final_file_aug.csv" , header = TRUE, row.names = FALSE)

# Starting the modeling

setwd("/home/asakhardhande04_sm/Aug_first_week")
getwd()

final_file <- read.csv("TC_final_file_aug_cleaned.csv", header= TRUE)
nrow(final_file)
names(final_file)

final_file_model <- final_file[,c(1,2,5,6)]
nrow(final_file_model)
class(final_file_model)
names(final_file_model)
head(final_file_model,3)

write.csv(final_file_model, file = "TC_final_file_aug_model_building.csv" , row.names = FALSE)

head(final_file_model[,2],3)
class(final_file_model[,2])
final_file_model[,2] <- gsub('[^A-Za-z0-9_ ]', '', final_file_model[,2])
head(final_file_model[,2],3)
class(final_file_model[,2])

# remove special characters
#Text_res <- gsub("@\\w+:*,()", "", final_file_model[,2])
final_file_model_cleaned$TEXT <- gsub("[[:punct:]]", "", final_file_model[,2])
# remove html links
final_file_model_cleaned$TEXT <- gsub("http\\w+", "", final_file_model_cleaned$TEXT)

# remove NAs in some_txt
final_file_model_cleaned$TEXT <- final_file_model_cleaned$TEXT[!is.na(final_file_model_cleaned$TEXT)]
#names(excel_res) <- NULL
head(final_file_model_cleaned$TEXT, 10)
#excel_res <- tolower(excel_res)
#excel_res

class(final_file_model_cleaned$TEXT)
Text_res <- as.data.frame(Text_res)
final_file_model_cleaned <- final_file_model
final_file_model_cleaned$NEW.CONTENT.TEXT <- Text_res
head(cbind(final_file_model_cleaned, Text_res),5)

names(final_file_model_cleaned)
class(final_file_model_cleaned)
nrow(final_file_model_cleaned)
head(final_file_model_cleaned, 5)
final_file_model_cleaned$CONTENT.TEXT <- NULL
final_file_model_cleaned$NEW.CONTENT.TEXT <- NULL

final <- NULL
final <- final_file_model_cleaned$CONTENT.ID
final <- as.data.frame(final)
names(final) <- "CONTENT.ID"
final$CONTENT.TEXT <- final_file_model_cleaned$TEXT
final$CONTENT.CONTENT.MEDIA.TYPE <- final_file_model_cleaned$CONTENT.MEDIA.TYPE
final$CONTENT.PUBLISH.DATE <- final_file_model_cleaned$CONTENT.PUBLISH.DATE

names(final)
class(final)
nrow(final)

write.csv(final, file = "TC_final_file_aug_model_building_cleaned1.csv", row.names = FALSE)

# Model building exercise

final_file_model[1:3,c(1:4)]

final_file_model$CONTENT.ID <- as.numeric(final_file_model$CONTENT.ID)
final_file_model$CONTENT.TEXT <- as.character(final_file_model$CONTENT.TEXT)
final_file_model$CONTENT.MEDIA.TYPE <- as.numeric(final_file_model$CONTENT.MEDIA.TYPE)
final_file_model$CONTENT.PUBLISH.DATE <- as.character(final_file_model$CONTENT.PUBLISH.DATE)

model
summary(model)

dim(final_file_model)
#final_file_model <- final_file_model[-12,]
pred <- predict(model, final_file_model[,c(1:4)])
pred <- predict(model, final_file_model[,2])
#pred <- predict(model, file5_test[,c(1:4)])
pred

# Testing

pred <- predict(model_after_tune, final_file_model[,c(1:4)])
pred
table(pred, file52_test$VALID)
table(pred, file52_test$VALID, dnn = c("Predicted", "Actual"))






