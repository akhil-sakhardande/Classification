# R script to add Link column


# Author: Akhil Sakhardandegetwd()
setwd("/tcad2/client04_sm/Akhil/TC_files")

f1 <- read.csv(file = "SocialMedia_CollatedData_24JUN2016_Filtered.csv", header=TRUE)[,c(2,5)]
nrow(f1)
head(f1)
f2 <- read.csv(file = "TC_Final_SM_0726.csv", header=TRUE)
head(f2,2)
f3 <- merge(f1,f2, by="CONTENT.ID")
nrow(f3)
head(f3,2)
write.csv(f3, file = "/home/asakhardhande04_sm/TC_Final_SM_0801.csv", row.names =FALSE)