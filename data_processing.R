# R codes for data processing
# Author: Akhil Sakhardande

setwd("/home/asakhardhande04_sm/Aug_first_week")
getwd()

#require(xlsx)

#data_c<-read.xlsx("SocialMedia_CollatedData_24JUN2016_Orig.xlsx", sheetName = "Sheet1")
data_c <- read.csv("TC_final_file_aug.csv", header = TRUE, sep = ",")
names(data_c)
nrow(data_c)
#data_c$X01TataCapital_10081615580707PM.xlsx <- NULL
data_c$FILE_NAMES <- NULL
names(data_c)
class(data_c)

#Removing brand posts by company names as Authors

non_branded1<-subset(data_c,!(grepl("Tata Talingchan|Tata Capital Ltd|Tata Docomo|tata photon plus chennai|tata photon wifi chennai|Tata Capital|Tata Consultancy Services|Ratan N. Tata|Tata Group|Tata Housing Development Customer Care|tata werneck fans|Tata Steel in Europe|Tata Power|Tata Medical Center",data_c$AUTHOR)))
non_branded1<-subset(non_branded1,!(grepl("Standard Chartered India|Standard Chartered|Standard Chartered UAE",non_branded1$AUTHOR)))
non_branded1<-subset(non_branded1,!(grepl("Bajaj Finance Ltd|Bajaj Finserv|Bajaj Allianz GIC|Bajaj Allianz Life|Bajaj Allianz Customer Care|Birla Finance",non_branded1$AUTHOR)))
non_branded1<-subset(non_branded1,!(grepl("Mahindra Finance|Reliance Taxi|Reliance Digital|Religare Online|Religare Enterprises",non_branded1$AUTHOR)))
non_branded1<-subset(non_branded1,!(grepl("HDFC Life|HDFC ERGO GIC|HDFC Ltd.|hdfcbank_cares|HDFC Bank Customer Care|HDFC Bank|HDFC securities|HDFC AUTO LOAN",non_branded1$AUTHOR)))
non_branded1<-subset(non_branded1,!(grepl("Citibank India",non_branded1$AUTHOR)))
non_branded1<-subset(non_branded1,!(grepl("ICICI Bank",non_branded1$AUTHOR)))

head(non_branded1,2)
nrow(non_branded1)
#Removing brand posts with http-web link


non_branded2<-subset(non_branded1,!(grepl("http",non_branded1$CONTENT.TEXT)))
non_branded2<-subset(non_branded2,!(grepl("Shaandaar|InstaDiwali|GharWali|instadiwali",non_branded2$CONTENT.TEXT)))
#write.csv(non_branded2,"non_branded2_1306.csv")
nrow(non_branded2)

#Removing authors posting for the company
non_branded3<-subset(non_branded2,!(grepl("vaibhav patel|Unknown|The Lunatic FringeT|Amandeep Singh|Insta Diwali|girishbhaip|Rishika Rao|Varudh Chilkeshwaram|naresh kumar garg|Enumula Sriharimanan raval",non_branded2$AUTHOR)))
nrow(non_branded3)
#Removing Authors for citibank who are posting for brand
non_branded3<-subset(non_branded3,!(grepl("Unknown|India Today News|Beautiful India|Jayaprakash Mohan|MakeMyTrip Care",non_branded3$AUTHOR)))

#Removing Any Extra Frequent Authors who post for brand or company
non_branded3<-subset(non_branded3,!(grepl("AMITESH MISHRA|Abheek Barua|ACHAL CHAUHAN|Ameeta S|Bloomberg TV India|charu mahajan|CNBC-TV18|ET NOW|Metro Loan Wala|noreply@blogger.com (Indian Real Estate News)|OP tak|Our Bureau|Prajna Capital|prince|Pushkar Gupta|Rahul Sasane|Sadhana Singh|Surbhi Jain|Thakur Jai Singh|Timothy Moore",non_branded3$AUTHOR)))

rem_authors_vector <- c('anupama pattanaik','anupama pattanaik','Surender Sharma','Surender Sharma','Jitendra Kumar','Jitendra Kumar','Capital Trends','Rachna Bhola','WNN7','dubaisavers','dubaisavers','Loansninsurances','MessiBusinessPlus 1','ShuSeng Lee','jaldibankloan.com','jaldibankloan.com','Rajesh Singh','Asfak AsfakBhai','Sambasivarao Pasumarthi','bv rathnam','akram banjara','manoj parmar','Kamal Sharma','anil pandey','Antaryami Behera','Mukesh Mehra','Sirimuri Baburao','ganesh kumar','raja raja','Arjun ranakoti','Jay goswami','Joji Reddy','Shaik Javid','ARUN KUMAR','Sunil Gupta','Bhoja Kulal','Tarakesh Surisetty','sanjay patil','kamal kumar','Sunil Gupta','Sunil Gupta','Pankaj Khanna','Arindam Chakraborty','Sunil Jadav','Martin M R Martin M R','Kishor Das','Harjeet Singh','Srinibas Dash','Venkatesan Udaiyar','H GHOUSE BASHA','karan arora','Hakmaram Lohar','Mukesh Kanjwani','NANDKUMAR JHA','durgaprasad durgaprasad','Bharat Chhetiya','Vikas Thakur','Digambar Sahoo','rahul krishnan','David Gomes','bhimrao Mandhare','THAMARAI KANNAN','Abul Kalam Kazi','Krish Nag','Nagesh Ovhal','babulu pinnam','Vijayalakshmi Selvaraj','Santosh Parab','Rohan Chuahan','Velliangiri A','saryu prasad mishra','Shefali Nigam','Stephen .J','Stephen .J','Manoj Shukla','RAMESH SHINDE','Mustak Shekh','Jagdish chand','Vivek Bandi2016','Ashique Ressel','Jagdish chand','Jamshed Ali Khan','Yogesh  Kumar','krishna minz','Venkata Siva Sandeep','Diana Williams','Home Loan-Hitch Key','Sufiyan','renganathan rajasekar','sourav muhale','Bharatram Mehroliya','Ashish Verma','SANJAY CHOUHAN','Sunil Kumar','Sunil Kumar','praful m','Kishore Gupta','tuhin Maiti','Abdul Shaikh','Ravi Pandey','Arvind Ohja','qumruddin shaikh','mohd isaa','Gegraj Saini','Osman Hadrami','KALLAPPA JAYAKKANAVAR','pradeep more','Shri Krishan','bappa roy','RAJINDER KUMAR','Khub Ram','Muthiah Ganesan Valli','Mohammed Nasir','Vijay Mahato','anju kakkar','vijay kumar','ANDREW DIAS','pd rampur','malla reddy','Ram Chouhan','Shraban Nath Sanyal','Ramesh Goud','Ramesh Goud','Nagesh Goyal','toufeeq pasha','Suraj Sehgal','Kalyan singh','Unnikrishnan.K.V Unni','Stephen Saint','Stephen Saint','Imran Ajmeria (ajmeria com)','Mukeem Ahmad','Salman Pathan','Biz2Credit Info Services: Small Business Loans for SMEs','3novices','3novices','Personal Loans','Amit Shah')
non_branded3<-subset(non_branded3,!(non_branded3$AUTHOR %in% rem_authors_vector))

#removing HDFC bank news posts
non_branded3<-subset(non_branded3,!(grepl("HDFCBankNews",non_branded3$CONTENT.TEXT)))
#write.csv(non_branded3,"non_branded3_1306.csv")
nrow(non_branded3)
#Removing News Channel
non_branded3<-subset(non_branded3,!(grepl("ET NOW|CNBC-TV18|Bloomberg TV India",non_branded3$AUTHOR)))

#Removing Customer Care replies
non_branded3<-subset(non_branded3,!(grepl("ICICI Bank Cares	Paytm Care|ATN CARE- Service|Indian Customer Care Numbers|TATA Capital Customer Care|Capital First Customer Care|Kotak Mahindra Bank|Customer Care",non_branded3$AUTHOR)))
nrow(non_branded3)

#narrowing to 4 channels-excludings news blog and message forums
non_branded4<-subset(non_branded3,(grepl("Twitter|Facebook|Youtube|GooglePlus",non_branded3$CONTENT.MEDIA.TYPE)))
nrow(non_branded4)
dim(non_branded4)

write.csv(non_branded4,"TC_final_file_aug_cleaned.csv", row.names = FALSE)

#tata capital post
#set1<-subset(non_branded4,non_branded4$Group==1)
#competitor posts
#set2<-subset(non_branded4,non_branded4$Group==2)

#-----------------***---------------------------
