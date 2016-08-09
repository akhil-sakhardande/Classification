# R script to implement Naive Bayes on text data

getwd()
#setwd("/home/asakhardhande04_sm/codes_akhil/tata_cap/")

# Reading the file
file5 <- read.csv("~/file_merged_3_months.csv")
#View(file5)
dim(file5)
names(file5)
file5$X <- NULL #Not useful column
names(file5)

# Sampling - SAC strategy
#sp <- split(file5, list(file5$VALID))
#samples <- lapply(sp, function(x) x[sample(1:nrow(x), 50, FALSE),])
#file5_out <- do.call(rbind, samples)

# Sampling - divided strategy
library(caTools)
train_rows <- sample.split(file5$VALID, SplitRatio=0.8)
train_rows
file5_train <- file5[train_rows,]
file5_test <- file5[!train_rows,]
nrow(file5_train)
nrow(file5_test)

# Checking the value distribution (Records in the sample sets)
nrow(subset(file5_train, file5_train$VALID == "Yes")) # 49
nrow(subset(file5_train, file5_train$VALID == "No")) # 122

nrow(subset(file5_test, file5_test$VALID == "Yes")) # 21
nrow(subset(file5_test, file5_test$VALID == "No")) # 53

# Building the model
library(e1071)
model <- naiveBayes(file5_train$VALID ~ ., data = file5_train)
model
#pred <- predict(model, file5_test[,-1])
pred <- predict(model, file5_test[,c(1:4)])
pred
table(pred, file5_test$VALID)
table(pred, file5_test$VALID, dnn = c("Predicted", "Actual"))
d <- table(pred, file5_test$VALID, dnn = c("Predicted", "Actual"))

# Model accuracy
model_accuracy <- sum(diag(d))/sum(d)
model_accuracy
model_incorrect_class <- 1-sum(diag(d))/sum(d)
model_incorrect_class

3/35 # Type I error = 0.08571429
12/14 # Type II error = 0.8571429







