## ------------------------------------------------------------------------
# This will destroy the environment by collecting all the values that are presentin the environment as list
rm(list = ls(all = T))

## ------------------------------------------------------------------------
getwd()
setwd("")



## solution 2------------------------------------------------------------------------

grpA=c(0,0,0,0,0,0,1,1,1,16)
grpB=c(3,12,3.5,14,3,2.8,5,9,5.5,9)
grpC=c(14,9.5,4.5,7.5,5,2,4.8,3.6,6,8.5)
grpD=c(9,4.5,9,8,4,6,5,3.5,2.8,12)
grpE=c(16,12,6.5,1,11,5,3,8,3,4)
grpF=c(13,10,10,1,3,4,6,3.8,4,8)
pgp = data.frame(grpA,grpB,grpC,grpD,grpE,grpF)

## ------------------------------------------------------------------------
#2.a
grps_mean = apply(X = pgp,
                  MARGIN =2,
                  FUN =mean)
grps_mean

##2.b ------------------------------------------------------------------------
grps_median = apply(X = pgp,
                  MARGIN =2,
                  FUN =median)
grps_median

## 2.c ------------------------------------------------------------------------
(group_Average = mean(grps_mean))
(group_Average = mean(as.matrix(pgp)))
## Yes the average of averages and average on the entire data frame is same

## ------------------------------------------------------------------------
(grpnewE = c(grpE,17))
(grpnewF = c(grpF,20))
(grpE_mean = mean(grpnewE))
(grpF_mean = mean(grpnewF))

## ------------------------------------------------------------------------
(pgp_average = mean(c(mean(grpA),mean(grpB),mean(grpC),mean(grpD),grpE_mean,grpF_mean)))
(pgp_grandaverage = mean(c(grpA,grpB,grpC,grpD,grpnewE,grpnewF)))



#solution 3
## ------------------------------------------------------------------------
delivery = read.csv(file = "deliveryserivces.csv",sep = ",",header=TRUE)

## ------------------------------------------------------------------------

  mn = mean(x)
  med = median(x)
  q1 = quantile(x)[2]
  q2 = quantile(x)[3]
  q3 = quantile(x)[4]
  min = range(x)[1]
  max = range(x)[2]
  iqr = IQR(x)
  var = var(x)
  sd= sd(x)


##solution example 3
## ------------------------------------------------------------------------
boxplot(delivery$EagleBoys,col="red",xlab = "Eagle Boys",ylab="Delivery Time",main="Boxplot for delivery time of  Eagle Boys ")
boxplot(delivery$FoodPanda,col="green",xlab = "Food Panda",ylab="Delivery Time",main="Boxplot for delivery time of Food Panda ")
boxplot(delivery$Swiggy,col="blue",xlab = "Swiggy",ylab="Delivery Time",main="Boxplot for delivery time  ofSwiggy ")
boxplot(delivery$PiazzaHut,col="yellow",xlab = "Piazza Hut",ylab="Delivery Time",main="Boxplot for delivery time ofPiazza Hut")
boxplot(delivery$Dominos,col="violet",xlab = "Dominos",ylab="Delivery Time",main="Boxplot for delivery time of Dominos ")

boxplot.matrix(as.matrix(delivery),col = c("red","green","blue","yellow","violet"),ylab = "Delivery Time",main="Boxplot for Delivery Time from different sources in Data ")


## ------------------------------------------------------------------------
## Increase to 3*IQR
boxplot.matrix(as.matrix(delivery),col = c("red","green","blue","yellow","violet"),ylab = "Delivery Time",main="Boxplot for Delivery Times in Data with whiskers changed to 3*IQR ",range=3)
## Decrease to 1*IQR
boxplot.matrix(as.matrix(delivery),col = c("red","green","blue","yellow","violet"),ylab = "Delivery Time",main="Boxplot for Delivery Time in Data with whiskers changed to 1*IQR ",range=1)

## ------------------------------------------------------------------------
x = c(15,21,20,20,20)
y = c(30,25,12,35,0)
worker = data.frame(x,y)
rownames(worker)= c("Mon","Tue","Wed","Thu","Fri")
colnames(worker)= c("Philip","Mathews")
worker

## ------------------------------------------------------------------------
(mean_Philip = mean(worker$Philip))
(mean_Mathews = mean(worker$Mathews))

(median_Philip = median(worker$Philip))
(medain_Mathews = median(worker$Mathews))

(range_Philip = max(worker$Philip)-min(worker$Philip))
(range_Mathews = max(worker$Mathews)-min(worker$Mathews))

## ------------------------------------------------------------------------

variance = function(x){
  var = mean((x-mean(x))^2)
  return(var)
}
stdev = function(x) {
  stdev = sqrt(mean((x-mean(x))^2))
  return(stdev)
}
variance_Philip = variance(worker$Philip)
variance_Philip
variance_Mathews = variance(worker$Mathews)
variance_Mathews
sd_Philip = stdev(worker$Philip)
sd_Philip
sd_Mathews = stdev(worker$Mathews) 
sd_Mathews

## Philip is more consistent than Mathew 

## ------------------------------------------------------------------------
x = c(8,6,2,4,6,6,8,10,8)
table(x)
names(which.max(table(x)))

##solution 5 ------------------------------------------------------------------------
fruits = c("apples","apples","apples","grapes","mangoes")
table(fruits)
names(which.max(table(fruits)))

## ------------------------------------------------------------------------
#install.packages("modes")
library(modes)
modes(fruits,3)


## solution 6------------------------------------------------------------------------
scores = c(11, 7.5, 8.5, 10, 10, 10.5, 5.5, 10, 9, 9.5, 5.25, 8, 6.5, 10.5, 8.75, 0, 6, 6, 6.75,8.75, 0, 9.5, 7.5, 8.5, 7) 
range(scores)
sd(scores)
length(scores)
s_scores=sort(scores)
q_1=s_scores[1:12]
q_1
median(q_1)
median(scores)
quartiles = quantile(x = scores,probs = c(0.25,0.5,0.75))
quartiles
quantile(scores)
boxplot(scores,ylab="scores",main="boxplot of scores ",col="green")

## 7:------------------------------------------------------------------------


supplier1 = c(17,22,22,22,27)
supplier2=c(17,19,20,27,27)
(suppliers = data.frame(supplier1,supplier2))

## ------------------------------------------------------------------------
range_supplier1 = range(suppliers$supplier1)
range_supplier2 = range(suppliers$supplier2)
range_supplier1
range_supplier2

## ------------------------------------------------------------------------
mean_supplier1 = mean(suppliers$supplier1)
mean_supplier2 = mean(suppliers$supplier2)
mean_supplier1
mean_supplier2

## ------------------------------------------------------------------------
sd_supplier1 = sd(suppliers$supplier1)
sd_supplier2 = sd(suppliers$supplier2)
sd_supplier1
sd_supplier2
## First supplier is more consistent

## ------------------------------------------------------------------------
# fill your answers here







## ------------------------------------------------------------------------
# Fill your answers here










