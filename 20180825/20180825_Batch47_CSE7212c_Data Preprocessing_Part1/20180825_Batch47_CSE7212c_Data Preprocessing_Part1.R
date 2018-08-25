#######Batch 47 Introduction to Data Preprocessing########
#############################################################

######Case1
rm(list=ls(all=TRUE)) #clears the environment

getwd()
setwd("/Users/amithprasad/repos/insofe_data_sc/20180825/20180825_Batch47_CSE7212c_Data Preprocessing_Part1") #setting the working directory

################################################################
#Importing csv
data<-read.csv("Data.csv",header=T)
data

#exporting csv


write.csv("")


###############################################################

#Undertanding data structure and summary statistics
str(data)
head(data)
tail(data)
summary(data)
names(data)
dim(data)

####################################################################
#Subsetting data
Data_NumAtr<-subset(data,select=c(Age,Experience,Income,CCAvg,Mortgage))
Data_CatAtr<-subset(data,select=-c(Age,Experience,Income,CCAvg,Mortgage))


str(Data_CatAtr)



#Converting categorical attributes as factors
Data_CatAtr$ID<-as.factor(Data_CatAtr$ID) # One by one
str(Data_CatAtr)

#All at once  using apply function
Data_CatAtr<-data.frame(
  apply(Data_CatAtr,2,function(x){as.factor(x)}))
str(Data_CatAtr)



#################################################################
#Creating dummy variables and adding to original table
#install.packages("dummies")
library(dummies)
EduDummyVars<-dummy(data$Education)
head(EduDummyVars)
Data<-data.frame(data,EduDummyVars)


###############################################################
#Discretizing the variable
install.packages("infotheo")
library(infotheo)
IncomeBin <- discretize(data$Income, disc="equalfreq",
                        nbins=4)
table(IncomeBin)


d = c(2,4,6,7,5,8)
discretize(d, disc="equalfreq",
           nbins=2)
discretize(d, disc="equalwidth",
           nbins=2)

median(d)
#################################################################

#Standardizing the data 
# install.packages("vegan")
library(vegan)

k=c(2,4,5,6,7,200)



n <- decostand(k,"range") # using range method 
s <- decostand(k,"standardize")
n
s

Data_NumAtr2 <- decostand(Data_NumAtr,
                          "range") # using range method 
Data_NumAtr2 <- decostand(Data_NumAtr,
                          "standardize") # Using Z score method
##################################################################


###Case 2
#Here we have three datasets, customer demographics, back info and transactions info
#we first read these into R

Customer_Bank<-read.csv("Customer_Bank Details_MV.csv",header=T,na.strings = "?")
Customer_Demographics<-read.csv("Customer_Demographics_MV_DOB.csv",header=T)
transactions<-read.csv("Transactions.csv",header=T)


#Understanding the data 
head(Customer_Bank)
summary(Customer_Bank)
summary(Customer_Demographics)
summary(transactions)

str(Customer_Bank)
str(Customer_Demographics)
str(transactions)

##There are missing values in the forms of NA and ? in the data, transactions
#data is in melted form, which we need to append to the customer data
sum(is.na(Customer_Bank))

#We shall solve each of these step by step
#First aggregating the values in transactions
##Aggregation

cust_level<-aggregate(Amount~ID,data = transactions,FUN=sum)

head(cust_level)
#Now you can merge this with the original data from analysis
# 
# #There are other libraries from which we can perform 
# #the aggregation operations. dplyr, sqldf are a couple of those
# 
# library(sqldf)
# A<-sqldf("select ID,sum(Amount) from transactions group by ID" )
# 
# library(dplyr)
# B=transactions %>%
#   group_by(ID) %>%
#   summarise(sum(Amount))
# 

##################################################################
##Handling Missing Values
Customer_Bank[Customer_Bank=="?"]<-NA
Customer_Demographics[Customer_Demographics=="?"]<-NA



##################################################################
#Merging two datasets
MergedData<-merge(Customer_Demographics,Customer_Bank,
                  by.x="Customer.ID",by.y="ID") #inner join
##In this case, we have same IDs in both the datasets, hence the 
## right and left outer joins doesn't seem intuitive. We take a dummy

## datasets to understands the major differences between the left join
## right joins
A=data.frame(Name=c("Alpha","Beta","Gamma","Delta"), Age=c(24,25,23,28))

B=data.frame(Name=c("Alpha","Gamma","Zeta","Psi"),Edu=c("M","D","B","H"))
MergedData1<-merge(A,B,
                  by.x="Name",by.y="Name",
                  all.x=TRUE) #left (outer) join
dim(MergedData1)
summary(MergedData1)
MergedData1
write.csv(MergedData1,"MergedData1.csv")
MergedData2<-merge(A,B,
                  by.x="Name",by.y="Name",
                  all.y=TRUE) #right (outer) join

dim(MergedData2)
summary(MergedData2)
MergedData2
write.csv(MergedData2,"MergedData2.csv")
MergedData3<-merge(A,B,
                   by.x="Name",by.y="Name",
                   all=TRUE) #Full (outer) join
dim(MergedData3)
summary(MergedData3)
MergedData3
write.csv(MergedData3,"MergedData3.csv")
##Observe the data as done in case 1:
#You find there are missing values. 
sum(is.na(MergedData))#To check null values in data
summary(MergedData)

###################################################################
#Dropping the records with missing values
MergedData_mv2<-na.omit(MergedData)

#To identify rows where more than 20% attributes 
#are missing
library(DMwR)
manyNAs(MergedData, 0.1) 
?manyNAs
#Imputing missing values
library(DMwR)
MergedData_imputed<-centralImputation(MergedData) #Cenral Imputation
sum(is.na(MergedData_imputed))


##There are other ways/methods of imputing. You will learn them soon
## either in class or through assignments


####################################################################
#However, we can work with NA strings while reading the file itself
cus=read.csv("Customer_Bank Details_MV.csv",header=T,na.strings = c(NA,"?"))


################# HOTE 3 ####################
# 1. list out all the numerical and categorical attrs along with the levels
# are the columns hav ethe right data type if not assign right ones
# check for the NA values
# give the count of the NA values
# factor
# impute using both the techniques
# standardize it - only numerical
# create a csv file for the dataframe without NAs
# upload the csv as Hote3


head(cus)
summary(cus)
tail(cus)

sum(is.na(cus))

cus_num<-subset(cus,select=c(CCAvg,Mortgage))
cus_cat<-subset(cus,select=-c(CCAvg,Mortgage))
head(cus_num)
head(cus_cat)
summary(cus_num)

# numeric data imputation
imputed_cus_num_central<-centralImputation(cus_num) #Cenral Imputation

# for knn min 3 cols is required
dim(cus_num)
rand_arr = runif(5000, 0, 10^2)
cus_num_for_knn = cbind(cus_num,rand_arr)
dim(cus_num_for_knn)
imputed_cus_num_knn<-knnImputation(cus_num_for_knn,3) # Knn Imputation
imputed_cus_num_knn

# categorical data imputation
imputed_cus_cat_central<-centralImputation(cus_cat) #Cenral Imputation
imputed_cus_cat_knn<-knnImputation(cus_cat) #Cenral Imputation

# factor
imputed_cus_cat_central<-data.frame(apply(imputed_cus_cat_central,2,function(x){as.factor(x)}))
imputed_cus_cat_knn<-data.frame(apply(imputed_cus_cat_knn,2,function(x){as.factor(x)}))

sum(is.na(imputed_cus_num_central))
sum(is.na(imputed_cus_cat_central))
sum(is.na(imputed_cus_cat_knn))

# standardize
std_imputed_cus_num_central <- decostand(imputed_cus_num_central,"standardize") 
str(std_imputed_cus_num_central)

final_data = data.frame(imputed_cus_cat_central,std_imputed_cus_num_central)
write.csv(final_data,"final_data.csv")

###################################################################
##########Handling dates
#In this data set we are working with Date of birth and not age
#How to extract age from date of birth
library(lubridate)
MergedData_imputed$DOB<-as.character(MergedData_imputed$DOB)
head(MergedData_imputed$DOB)<-strptime(MergedData_imputed$DOB,format="%m/%d/%Y")
MergedData_imputed$Age<-year(today())-year(MergedData_imputed$DOB)
names(MergedData_imputed)



#Now we can remove DOB column and work with age as we have done in Case1

MergedData_imputed <-MergedData_imputed[ , -which(names(MergedData_imputed) %in% c("DOB"))]


cbind(MergedData,MergedData_imputed$Age)

##################################################################
#using dcast
?dcast

library(reshape2)
z <- data.frame(
  item=letters[rep(24:26,2)],
  freq=c(4,3,2,4,4,1),
  id=rep(1:2,each=3)
)
z
dcast(z, id ~ item, value.var="freq")

#melt
names(airquality) <- tolower(names(airquality))
head(airquality)
head(melt(airquality, id=c("month", "day")))


  




