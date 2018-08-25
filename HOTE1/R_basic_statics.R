################     A C T I V I T Y     D A Y - 02  #####################

#////////////////////////////////////    A C T I V I T Y - 02 /////////////
Group1 <- c(0,0,0,0,0,0,1,1,1,16)
Group2 <- c(3,12,3.5,14,3,2.8,5,9,5.5,9)
Group3  <- c(14,9.5,4.5,7.5,5,2,4.8,3.6,6,8.5)
Group4  <- c(9,4.5,9,8,4,6,5,3.5,2.8,12)
Group5  <- c(16,12,6.5,1,11,5,3,8,3,4)
Group6 <- c(13,10,10,1,3,4,6,3.8,4,8)
cpee <- data.frame(Group1,Group2,Group3,Group4,Group5,Group6)
cpee
Average1 = mean(Group1)
Average2 = mean(Group2)
Average3 = mean(Group3)
Average4 = mean(Group4)
Average5 = mean(Group5)
Average6 = mean(Group6)
Average5
Median1 = median(Group1)
Median2 = median(Group2)
Median3 = median(Group3)
Median4 = median(Group4)
Median5 = median(Group5)
Median6 = median(Group6)
#-----------      a l l     a v e r a g e s
Averages = list(Average1,Average2,Average3,Average4,Average5,Average6)
names(Averages) = c("Group1","Group2","Group3","Group4","Group5","Group6")

Averages
#-----------     g r a n d    a v e r a g e

Grand_Average = mean(c(Average1,Average2,Average3,Average4,Average5,Average6))

Grand_Average
 #----------      a l l    m e d i a n s
Medians = list(Median1,Median2,Median3,Median4,Median5,Median6)
names(Medians) = c("Group1","Group2","Group3","Group4","Group5","Group6")

Medians

#Add an extra person with experience of 17 to Group5 and calculate the mean.
Group5 = c(Group5,17)
Group5
mean(Group5)


# Add an extra person with experience of 20 to Group6 and calculate the median.
Group6 = c(Group6,20)
Group6
median(Group6)




##///////////////////////////// A C T I V I T Y - 3 //////////////////////////


getwd()
setwd("/Users/vishwajeetbandi/Downloads/batch_47")
deliveryservices = read.csv(file = "deliveryservices.csv",sep = ",",header=TRUE)
deliveryservices
summary(deliveryservices)

# ///////////////////////// E A G L E    B O Y S /////////////////#
mean_service = mean(deliveryservices$EagleBoys) 
mean_service

median_service = median(deliveryservices$EagleBoys)
median_service

temp <- table(as.vector(deliveryservices$EagleBoys))
mode_services = names(temp)[temp == max(temp)]
mode_services

quartiles = quantile(deliveryservices$EagleBoys)
quartiles

ranges = range(deliveryservices$EagleBoys)
ranges

iqr_service = IQR(deliveryservices$EagleBoys)
iqr_service

variance = var(deliveryservices$EagleBoys)
variance

standard_dev = sd(deliveryservices$EagleBoys)
standard_dev

CENTRAL_TENDANCIES_EAGLEBOYS = list(mean_service,median_service,mode_services,quartiles,ranges,iqr_service,variance,standard_dev)
names(CENTRAL_TENDANCIES_EAGLEBOYS) = c("MEAN","MEDIAN","MODE","QUARTILES","RANGE","IQR","VARIANCE","STANDARD DEVIATION")
CENTRAL_TENDANCIES_EAGLEBOYS



# ///////////////////////// F O O D     P A N D A////////////////////////#
mean_service = mean(deliveryservices$FoodPanda) 
mean_service

median_service = median(deliveryservices$FoodPanda)
median_service

temp <- table(as.vector(deliveryservices$FoodPanda))
mode_services = names(temp)[temp == max(temp)]
mode_services

quartiles = quantile(deliveryservices$FoodPanda)
quartiles

ranges = range(deliveryservices$FoodPanda)
ranges

iqr_service = IQR(deliveryservices$FoodPanda)
iqr_service

variance = var(deliveryservices$FoodPanda)
variance

standard_dev = sd(deliveryservices$FoodPanda)
standard_dev

CENTRAL_TENDANCIES_FOODPANDA = list(mean_service,median_service,mode_services,quartiles,ranges,iqr_service,variance,standard_dev)
names(CENTRAL_TENDANCIES_FOODPANDA) = c("MEAN","MEDIAN","MODE","QUARTILES","RANGE","IQR","VARIANCE","STANDARD DEVIATION")
CENTRAL_TENDANCIES_FOODPANDA

# ///////////////////////// S W I G G Y ///////////////////////#
mean_service = mean(deliveryservices$Swiggy) 
mean_service

median_service = median(deliveryservices$Swiggy)
median_service

temp <- table(as.vector(deliveryservices$Swiggy))
mode_services = names(temp)[temp == max(temp)]
mode_services

quartiles = quantile(deliveryservices$Swiggy)
quartiles

ranges = range(deliveryservices$Swiggy)
ranges

iqr_service = IQR(deliveryservices$Swiggy)
iqr_service

variance = var(deliveryservices$Swiggy)
variance

standard_dev = sd(deliveryservices$Swiggy)
standard_dev

CENTRAL_TENDANCIES_SWIGGY = list(mean_service,median_service,mode_services,quartiles,ranges,iqr_service,variance,standard_dev)
names(CENTRAL_TENDANCIES_SWIGGY) = c("MEAN","MEDIAN","MODE","QUARTILES","RANGE","IQR","VARIANCE","STANDARD DEVIATION")
CENTRAL_TENDANCIES_SWIGGY

# ///////////////////////// P I Z Z A    H U T /////////////////////////#
mean_service = mean(deliveryservices$PiazzaHut) 
mean_service

median_service = median(deliveryservices$PiazzaHut)
median_service

temp <- table(as.vector(deliveryservices$PiazzaHut))
mode_services = names(temp)[temp == max(temp)]
mode_services

quartiles = quantile(deliveryservices$PiazzaHut)
quartiles

ranges = range(deliveryservices$PiazzaHut)
ranges

iqr_service = IQR(deliveryservices$PiazzaHut)
iqr_service

variance = var(deliveryservices$PiazzaHut)
variance

standard_dev = sd(deliveryservices$PiazzaHut)
standard_dev

CENTRAL_TENDANCIES_PIAZZAHUT = list(mean_service,median_service,mode_services,quartiles,ranges,iqr_service,variance,standard_dev)
names(CENTRAL_TENDANCIES_PIAZZAHUT) = c("MEAN","MEDIAN","MODE","QUARTILES","RANGE","IQR","VARIANCE","STANDARD DEVIATION")
CENTRAL_TENDANCIES_PIAZZAHUT

# ///////////////////////// D O M I N O S //////////////////////////#
mean_service = mean(deliveryservices$Dominos) 
mean_service

median_service = median(deliveryservices$Dominos)
median_service

temp <- table(as.vector(deliveryservices$Dominos))
mode_services = names(temp)[temp == max(temp)]
mode_services

quartiles = quantile(deliveryservices$Dominos)
quartiles

ranges = range(deliveryservices$Dominos)
ranges

iqr_service = IQR(deliveryservices$Dominos)
iqr_service

variance = var(deliveryservices$Dominos)
variance

standard_dev = sd(deliveryservices$Dominos)
standard_dev

CENTRAL_TENDANCIES_DOMINOS = list(mean_service,median_service,mode_services,quartiles,ranges,iqr_service,variance,standard_dev)
names(CENTRAL_TENDANCIES_DOMINOS) = c("MEAN","MEDIAN","MODE","QUARTILES","RANGE","IQR","VARIANCE","STANDARD DEVIATION")
CENTRAL_TENDANCIES_DOMINOS


CENTRAL_TENDANCIES = list(CENTRAL_TENDANCIES_EAGLEBOYS,CENTRAL_TENDANCIES_FOODPANDA,CENTRAL_TENDANCIES_SWIGGY,CENTRAL_TENDANCIES_PIAZZAHUT,CENTRAL_TENDANCIES_DOMINOS)
names(CENTRAL_TENDANCIES) = c("EAGLE BOYS","FOOD PANDA","SWIGGY","PIZZA HUT","DOMINOS")
CENTRAL_TENDANCIES



central_measures = function(x){
  
    if (x == "Eagleboys") {
      result <- CENTRAL_TENDANCIES_EAGLEBOYS
    }
    else if (x == "Foodpanda") {
      result <- CENTRAL_TENDANCIES_FOODPANDA
    }

else if (x == "Swiggy") {
  result <- CENTRAL_TENDANCIES_SWIGGY
}


else if (x == "Piazzahut") {
  result <- CENTRAL_TENDANCIES_PIAZZAHUT
}
  

else if (x == "Dominos") {
  result <- CENTRAL_TENDANCIES_FOODPANDA
}  
    else {
      result <- "INVALID"
    }
    return(result)
  } 

 ############ BELOW STATEMENT  ( F  U  N  C  T  I  O  N  )   GIVES ALL MEASURES FOR A SELECTED COMPANY ################ 

# type   the   company    name   in   brackets   with   ("company name here ")      below   to   display   all   details
# first   letter   of   company   name   is   Capital
# Company   names  : "Eagleboys" , "Foodpanda" , "Swiggy", "Piazzahut" , "Dominos" .
                      


central_measures("Dominos")





##--------------------------- Plot the box plot for each of the delivery service. 

boxplot (deliveryservices, las = 2 , col = c ("red","green","sienna","yellow","blue"), main="D E L I V E R Y   S E R V I C E S")




###########################################  A C T I V I T Y - 0 4 #########################################


Philip = c(20,21,22,20,21)
Mathew = c(30,15,12,36,28)


Philip_mean = mean(Philip)
Philip_mean


Mathew_mean = mean(Mathew)
Mathew_mean


boxplot(Philip,Mathew,
                main = " Boxplots for comparision of workers",
                at = c(1,2),
                names = c("Philip", "Mathew"),
                las = 2,
                border = "black",
                col = c ("green","red"))



###---------- Philip is more consistient  (  f r o m    b o x p l o t).




###############################  A C T I V I T Y  - 0 5 ############################

actvty_5a = c(8,6,2,4,6,8,10,8)

temp <- table(as.vector(actvty_5a))
mode_number = names(temp)[temp == max(temp)]

mode_number


actvty_5b = c("apples","apples","apples","oranges","grapes")

temp <- table(as.vector(actvty_5b))
mode_character = names(temp)[temp == max(temp)]

mode_character



################################# A c t i v i t y    -  0 6 #########################################

scores = c(11, 7.5, 8.5, 10, 10, 10.5, 5.5, 10, 9, 9.5, 5.25, 8, 6.5, 10.5, 8.75, 0, 6, 6, 6.75,8.75,
           0, 9.5, 7.5, 8.5, 7)


mean_score = mean(scores) 
mean_score

median_scores = median(scores)
median_scores

temp <- table(as.vector(scores))
mode_scores = names(temp)[temp == max(temp)]
mode_scores

quartiles = quantile(scores)
quartiles

ranges = range(scores)
ranges

iqr_scores = IQR(scores)
iqr_scores

variance = var(scores)
variance

standard_dev = sd(scores)
standard_dev

CENTRAL_TENDANCIES_SCORES = list(mean_service,median_service,mode_services,quartiles,ranges,iqr_service,variance,standard_dev)
names(CENTRAL_TENDANCIES_SCORES) = c("MEAN","MEDIAN","MODE","QUARTILES","RANGE","IQR","VARIANCE","STANDARD DEVIATION")

#--------A L L    R E S U L T S

CENTRAL_TENDANCIES_SCORES


#----------- b o x p l o t

boxplot(scores,
        main = " Boxplots for scores",
        las = 2,
        border = "black",
        col = c ("azure3"))


#-------------  Outlier found  from boxplot


#########################################  A C T I V I T Y - 07  #########################################

supplier_1 = c(17,22,22,22,27)
supplier_2 = c(17,19,20,27,27)

#------- R A N G E S
range_s1 = range(supplier_1)
range_s1

range_s2 = range(supplier_2)
range_s2


#-------- M E A N S
mean_s1 = mean(supplier_1)
mean_s1


mean_s2 = mean(supplier_2)
mean_s2

#------------- Diffrences of suppliers shown through  B A R P L O T

 barplot((c(supplier_1,supplier_2)), beside = TRUE,
          col = c("black", "azure3"),
         legend.text = rownames(1),
           ylim = c(0, 30))
 title( main = "S U P P L I E R S - D I F F R E N C E S", font.main = 20)

 
 
 ####################################  A C T I V I T Y - 0 8 ###########################################

 
 #--------------------  a 
first100 = (1:100)

 first100
 
 
 mean_100 = mean(first100)
 mean_100

 median_100 = median(first100)
median_100  

##--------------------   b

random_vector = c(2,13,15,32,24,53,45,78,91)


random_mean = mean(random_vector)

random_mean


random_median = median(random_vector)
random_median


##--------------------  c

random_20_40 = c(20,21,22,23,24,30,31,32,33)


random_mean_20_40 = mean(random_20_40)

random_mean_20_40


random_median_20_40 = median(random_20_40)
random_median_20_40



##--------------------  d


ones = rep(1,10)
twos = rep(2,20)
threes = rep(3,30)

resulting_vector = c(ones,twos,threes)
resulting_vector


resulting_vector_mean = mean(resulting_vector)
resulting_vector_mean


resulting_vector_median = median(resulting_vector)
resulting_vector_median



################################  A C T I V I T Y  - 0 9 #################################################

#-------------------  a
mtcars

#------------------- b
summary(mtcars)


#------------------ c
num_data = data.frame(mtcars$mpg,mtcars$disp,mtcars$drat,mtcars$wt,mtcars$qsec)
num_data


#------------------ d
cat_data = data.frame(mtcars$cyl,mtcars$hp,mtcars$vs,mtcars$am,mtcars$gear,mtcars$carb)
cat_data


#------------------ e

mean_mpg  = mean(mtcars$mpg)
mean_disp = mean(mtcars$disp)
mean_drat = mean(mtcars$drat)
mean_wt   = mean(mtcars$wt)
mean_qsec = mean(mtcars$qsec)


MEAN_num_data =list(mean_mpg,mean_disp,mean_drat,mean_wt,mean_qsec)
names(MEAN_num_data) = c("MEAN-mpg","MEAN-disp","MEAN-drat","MEAN-wt","MEAN-qsec")
MEAN_num_data
boxplot(num_data,main = "BOXPLOT FOR NUMERICAL ATTRIBUTES",col = c("red","azure3","green","blue","sienna"))


#### I N F E R E N C E
##----- The Spread of data for Displacement in mtcars is more compared to other attributes.
##----- There is presence of   O U T L I E R S   for   "wt"   &    "qsec".


#----------------- f

car_cylinders = (mtcars$cyl)
car_cylinders

##---------  THERE ARE 7 SIX CYLINDER CARS :Mazda RX4,Mazda RX4 WAG ,Hornet 4 Drive , Valiant , Merc 280 , Merc 280C , Ferrari Dino


MEAN_mpg_6cyl = mean(c(21.0,21.0,21.4,18.1,19.2,17.8,19.7))
MEAN_mpg_6cyl
 mtcars
 
