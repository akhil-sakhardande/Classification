
# Author: Akhil Sakhardande
# reading file
file4 <- read.csv("~/file_all_text_YES_authors.csv")
View(file4)
head(file4, 5)

# removing duplicate records in the file if any
names(file4)
file4[,1]
unique(file4[,1:2])
deduped_file4 <- unique(file4[, 1:2])
nrow(deduped_file4)

# Cleaning the file for ''''@ pattern
gsub("[']","", a)
a1 <- gsub("[']","", deduped_file4$CONTENT.TEXT)
head(a1,3)
class
class(a1)
a1.df <- as.data.frame(a1)
head(a1.df,3)
deduped_file4$CONTENT.TEXT1 <- a1.df

# fetching email address
a <- c(a, "fulanito13@somemail.com.ar")
regmatches(a, regexpr("[[:alnum:]]+\\@[[:alpha:]]+\\.com", a))

V1 <- NULL
V1 <- vector("list")
class(V1)
regmatches(deduped_file4$CONTENT.TEXT1, regexpr("[[:alnum:]]+\\@[[:alpha:]]+\\.com", deduped_file4$CONTENT.TEXT1))

for (each in deduped_file4$CONTENT.TEXT1) {
  V1[each] <- regmatches(each, regexpr("[[:alnum:]]+\\@[[:alpha:]]+\\.com", each))
}

# Converting list to dataframes, and add to the originial file
class(V1)
length(V1)
V1.df <- data.frame(matrix(unlist(V1), nrow=60, byrow=T),stringsAsFactors=FALSE)
head(V1.df, 5)
deduped_file4$EMAIL_ADDRESS <- V1.df
head(deduped_file4,5)
names(deduped_file4)

# Writing file
write.csv(deduped_file4, file = "deduped_file_with_email.csv", row.names = FALSE)



