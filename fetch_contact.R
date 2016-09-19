
# Author: Akhil Sakhardande#Adding contact details

# Subsetting the main file for Valid LEAD records

final_file <- read.csv("~/final_file.csv")
View(final_file)
subset(final_file, final_file$VALID.LEAD == "Yes")
final_file1 <- subset(final_file, final_file$VALID.LEAD == "Yes")
nrow(final_file1)
write.csv(final_file1, file = "final_file_YES.csv", row.names = FALSE)

#Applying regular expressions to extract contact details

temp <- gregexpr("[0-9]+", final_file1$CONTENT.TEXT)
as.numeric(unique(unlist(regmatches(final_file1$CONTENT.TEXT, temp))))

gsub("[-'_&@!?#=/\\ .)(+]|[a-zA-Z]*:?","", final_file1$CONTENT.TEXT)
final_file1$CONTACT1 <- gsub("[-'_&@!?#=/\\ .)(+]|[a-zA-Z]*:?","", final_file1$CONTENT.TEXT)

#Extracting un-necessary values from contact
print(length("1234"))
print(nchar("1234"))
for (each in final_file1$CONTACT1) { print(nchar(each)) }
final_file1$CONTACT <- for (each in final_file1$CONTACT1) {
if (nchar(each) >= 9 && nchar(each) <= 10) { print(each) } else { print("NA") }
}

b <- NULL
b <- vector("list")
class(b)
for (each in final_file1$CONTACT1) {
  if (nchar(each) >= 9 ) { b[[each]] <- print(each) } else { b[[each]] <- print("NA") }
}
length(b)


ifelse(nchar(final_file1$CONTACT1) <= 8, "NA", final_file1$CONTACT1)
final_file1$CONTACT <- ifelse(nchar(final_file1$CONTACT1) <= 8, "NA", final_file1$CONTACT1)


#Combining texts for each author - original file

f1 <- read.csv("~/code/SocialMedia_CollatedData_24JUN2016_Filtered.csv")
View(f1)
names(f1)
f2 <- f1[,c(3,11)]
head(f2,2)

library(plyr)
#aggregate(CONTENT.TEXT ~ AUTHOR, data = test, paste, collapse = "," )
nrow(f2) # 41k rows
names(f2)
f3 <- aggregate(CONTENT.TEXT ~ AUTHOR, data = f2, paste, collapse = "," )
nrow(f3) # 16k rows
head(f3,3)
write.csv(f3, file = "file_combined_by_author.csv", row.names = FALSE)


# fetching contact details from the collated file

# Merging main & YES leads file
p1 <- read.csv("final_file_YES_0725.csv")
class(p1)
p2 <- p1[,6]
names(p2)
class(p2)
p2 <- as.data.frame(p2)

names(p2) <- "AUTHOR"
names(p2)
names(f3)
f4 <- merge(f3, p2, by = "AUTHOR")
nrow(f4) # New file with required authors
head(f4,5)
write.csv(f4, file = "file_all_text_YES_authors.csv", row.names = FALSE)

# Extracting contact from all text

names(f4)
names(f4)[2] <- "TEXT"
gsub("[-'_&@!,?#=/\\ .)(+]|[a-zA-Z]*:?","", f4$TEXT)
f4$CONTACT1 <- gsub("[-'_&@!,?#=/\\ .)(+]|[a-zA-Z]*:?","", f4$TEXT)


ifelse(nchar(f4$CONTACT1) <= 8, "NA", f4$CONTACT1)
final_file1$CONTACT <- ifelse(nchar(final_file1$CONTACT1) <= 8, "NA", final_file1$CONTACT1)


# Extract mobile numbers using lists

V2 <- NULL
#V3 <- NULL
V2 <- vector("list") 
class(V2)

temp <- gregexpr("[0-9]+", a)
as.numeric(unique(unlist(regmatches(a, temp))))

for (each in deduped_file4$CONTENT.TEXT1) {
  temp <- gregexpr("[0-9]+", each)
  V2[each] <- unique(regmatches(each, temp))
  #V2[each] <- max(as.numeric(unique(unlist(regmatches(each, temp)))))
  #V3 <- list(as.numeric(unique(regmatches(each, temp))))
}

#Identifying the max number from the list
lapply(V2,FUN=max)
V2.max <- lapply(V2,FUN=max)
V2.max

# Converting list to dataframes, and add to the originial file
V2.df <- data.frame(matrix(unlist(V2.max), nrow=60, byrow=T),stringsAsFactors=FALSE)
head(V2.df, 5)
deduped_file4$PHONE_NUMBER1 <- V2.df
head(deduped_file4,5)
names(deduped_file4)

#Filter the values properly
names(deduped_file4)

head(deduped_file4$PHONE_NUMBER1,50)
class(deduped_file4$PHONE_NUMBER1)
#deduped_file4$PHONE_NUMBER1 <- as.numeric(deduped_file4$PHONE_NUMBER1)
ifelse(nchar(deduped_file4$PHONE_NUMBER1) <= 9, "NA", deduped_file4$PHONE_NUMBER1)
#ifelse(length(deduped_file4$PHONE_NUMBER1) <= 8, "NA", deduped_file4$PHONE_NUMBER1)
deduped_file4$PHONE_NUMBER <- ifelse(nchar(deduped_file4$PHONE_NUMBER1) <= 9, "NA", deduped_file4$PHONE_NUMBER1)
class(deduped_file4)
write.csv(deduped_file4, file = "Test1.csv", row.names = FALSE)


# Merging the files to collate all the information
final_file_YES1 <- read.csv("~/final_file_YES.csv")
View(final_file_YES1)
names(final_file_YES1)
head(final_file_YES1[,1:7],3)
final_file_YES <- final_file_YES1[,1:7]














