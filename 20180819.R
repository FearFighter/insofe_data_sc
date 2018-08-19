result = function(test_stat,t_value){
  if(test_stat < t_value ){
    print("test_stat < t_value , so accept the null hypo, ie observed fits the expected")
  } else{
    print("test_stat > t_value , so reject the null hypo, ie observed doesn't fits the expected")
  }
}


result_two_tail_chi = function(test_stat,t1,t2){
  
  if(t1 <= test_stat && test_stat <= t2 ){
    print("test stat is in between the range, so accept the null hypo")
  } else{
    print("test stat is not in between the range, so reject the null hypo")
  }
}


# 1. Suppose a car manufacturer claims a model gets at least 25 mpg. A consumer group asks 10 owners of this model to 
# calculate their mpg and the mean value was 22 with a standard deviation of 1.5. Is the manufacturer's claim supported 
# at 95%confidence level.

# Ans
# H0 ; mean >= 25
# h1 : mean < 25
xbar = 22
m = 25
s = 1.5

alpha = 0.05
n=10
se = s/sqrt(n)
test_stat = (xbar-m)/se
test_stat
dof = n-1
t_value = qt(alpha,dof)
t_value

# -6.32 < -1.83, so reject the null hypothesis

# 2. An outbreak of Salmonella-related illness was attributed to ice cream produced at a certain factory. Scientists measured 
# the level of Salmonella in 9 randomly sampled batches of ice cream. The levels (in MPN/g) were: 
# 0.593 0.142 0.329 0.691 0.231 0.7930.519 0.392 0.418. Is there evidence that the mean level of Salmonella in the ice cream 
# is greater than 0.3 MPN/g


# H0: mean <= 0.3
# H1: mean > 0.3
# xbar
# m
# s
samples= c(0.593,0.142,0.329,0.691,0.231,0.793,0.519,0.392,0.418)
m = 0.3
xbar = mean(samples)
xbar
n = 9
s = sd(samples)
s

alpha = 0.95
se = s/sqrt(n)
test_stat = (xbar-m)/se
test_stat
dof = n-1
t_value = qt(alpha,dof)
t_value
dt(t_value)

# 2.205 > 1.85 , so we reject the null hypo

# given t_value finding x
t1 = t_value
x1 = (t1*se)+m
x1

# alternative
test_stat1 = t.test(samples,alternative="greater",mu=0.3)
t_value1 = qt(alpha,dof)

# if p-value < alpha reject

  

# 3. 6 subjects were given a drug (treatment group) and an additional 6 subjects a placebo (control group). 
# Their reaction time to a stimulus was measured (in ms). The outcome of both the group as follows
# Control = 91, 87, 99, 77, 88, 91
# Treat = 101, 110, 103, 93, 99, 104
# Test whether the drug has an effect or not (Assume higher reaction time is better ) ?

# 
control = c(91, 87, 99, 77, 88, 91)
treat = c(101, 110, 103, 93, 99, 104)

mc = mean(control)
mt = mean(treat)
s1 = sd(control)
s2 = sd(treat)

# H0: mt <= mc, mt - mc <= 0
# H1: mt > mc
t.test(x = treat,y = control,alternative = "greater",mu = 0,var.equal = TRUE)
t_value = qt(0.95,10)
t_value

# df for unpaired = (m-1)+(n-1), bcoz last data point in each sample can be calculated using the respective means
# df for paired = n-1, here the sample is tested say with drug and without drug so the n is always constant

# we reject the null hypo, 
# bcoz 3.4 > 1.8 
# or 0.003 < 0.05
# or 0 doesn't fall b/w 6.08 and infinity

# 4. A study was performed to test whether cars get better mileage on premium gas than on regular gas. 
# Each of 10 cars was first filled with either regular or premium gas, decided by a coin toss, and the mileage for 
# that tank was recorded. The mileage was recorded again for the same cars using the other kind of gasoline. 
# Test to determine whether cars get significantly better mileage with premium gas
# Reg : 16, 20, 21, 22, 23, 22, 27, 25, 27, 28
# Prem : 19, 22, 24, 24, 25, 25, 26, 26, 28, 32


reg = c(16, 20, 21, 22, 23, 22, 27, 25, 27, 28)
prem = c(19, 22, 24, 24, 25, 25, 26, 26, 28, 32)

mr = mean(reg)
mp = mean(prem)

# H0 : mp <= mr, or mp-mr <= 0 
# H1: mp > mr
t1 = t.test(x=prem,y=reg,alternative="greater",mu=0,var.equal = FALSE, paired = TRUE)
tvalue = qt(0.95,18)
tvalue

# we reject null hypo, premium is better than regular
# 0 doesn't lies b/w 1.180207 and infinity
# t_stat > t_value
# p value < 0.05
result(t1$statistic,tvalue)



# 5. A national survey agency conducts a nationwide survey on consumer satisfaction and finds out the response distribution as follows:
#   Excellent: 8%
# Good: 47%
# Fair: 34%
# Poor: 11%
# A store manager wants to find if these results of customer survey apply to the customers of super market in her city. So, she interviews 207 randomly selected customers and asked them to rate
# 20180819_Batch47_CSE7315c_Lab05_T_Chi_F_ANOVA
# Inspire???Educate???Transform. 2
# their responses. The results of this local survey are given below. Determine if the local responses from this survey are the same as expected frequencies of the national survey, at 95% confidence level.
# Response
# Frequency
# Excellent
# 21
# Good
# 109
# Fair
# 62
# Poor
# 15


# Ans

# chi squared , goodness test
# H0: obsertved dist fits the expected
# H1: obsertved dist doesn't fits the expected

observed = c(21,109,62,15)
expected = (c(8,47,34,11)/100)*sum(observed)

test_stat = sum((observed - expected)^2 / expected)
test_stat

crit = qchisq(0.05,3,lower.tail = F)
crit
result(test_stat,crit)

# 6. A survey is conducted by a gaming company that makes three video games. It wants to know if the preference of game depends on the gender of the player. Total number of participants is 1000. Here is the survey result
# Game A
# Game B
# Game C
# Total
# Male
# 200
# 150
# 50
# 400
# Female
# 250
# 300
# 50
# 600
# Total
# 450
# 450
# 100
# 1000

# a. State the null hypothesis and alternate hypothesis.
# b. Calculate the degrees of freedom.
# c. Does men's preference is different from women's preference? Check with 0.05 level of significance.

# Ans

# H0: games are independant of gender
# H1: games are not independant of gender

c(200,150,50)
c(250,300,50)

df = (3-1)*(2-1)

test_stat = sum((observed - expected)^2 / expected)
test_stat

crit = qchisq(0.05,3,lower.tail = F)
crit
result(test_stat,crit)

# complete this

# 7. Consider the hypothesis test of 
# Ho : ??2 = 0.01 against 
# H1 : ??2 ??? 0.01. 
# Sample size is 20 and sample variance is 0.0153. 
# Test the hypothesis for ?? = 0.05.

n=20
v = 0.0153
alpha = 0.05
t = ((n-1)*v)/0.01
t

crit1 = qchisq(0.975,19,lower.tail = F)
crit1

crit2 = qchisq(0.025,19,lower.tail = F)
crit2

result_two_tail_chi(t,crit1,crit2) 


# 8. laptop computer maker uses battery packs supplied by two companies, A and B. While both brands have the same average 
# battery life between charges (LBC), the computer maker seems to receive more complaints about shorter LBC than expected for 
# battery packs supplied by company B. The computer maker suspects that this could be caused by higher variance in LBC for
# Brand B. To check that, ten new battery packs from each brand are selected, installed on the same models of laptops, and the 
# laptops are allowed to run until the battery packs are completely discharged. The following are the observed LBCs in hours.

# Brand A = 3.2, 3.4, 2.8, 3, 3, 3, 2.8, 2.9, 3, 3
# Brand B = 3, 3.5, 2.9, 3.1, 2.3, 2, 3, 2.9, 3, 4.1
# Test, at the 10% level of significance, whether the variance of both the brands are similar.

a = c(3.2, 3.4, 2.8, 3, 3, 3, 2.8, 2.9, 3, 3)
b = c(3, 3.5, 2.9, 3.1, 2.3, 2, 3, 2.9, 3, 4.1)      

# H0: sigma1^2 = sigma2^2
# H0: sigma1^2 != sigma2^2

v1 = var(a)
v2 = var(b)

t = v1/v2
t

crit1 = qf(p = 0.05,df1 = 9,df2 = 9)
crit2 = qf(p = 0.95,df1 = 9,df2 = 9)
crit1
crit2

result_two_tail_chi(t,crit1,crit2) 

# 
# 9. A car crash research team wants to examine the safety of compact cars, intermediate and full size cars. Given below are the hypothetical values of the mean pressure applied to the drivers head during the crash test for each of the car types. Check whether means are equal for each type of these cars at 5% significance level.
# Compact
# 643
# 655
# 702
# Intermediate
# 469
# 427
# 525
# Full size
# 484
# 456
# 402


# H0: all means are equal
# H1: all means are not equal

ct = c(643,655,702)
it = c(469,427,525)
fs = c(484,456,402)

x = c(ct,it,fs)

sst = sum((x-mean(x))^2)
sst

ssw = sum((ct-mean(ct))^2) + sum((it-mean(it))^2) + sum((fs-mean(fs))^2)
ssw

ssb  = sst - ssw

m = 3
n = 3
df_ssb = (m-1)
df_ssw = m*(n-1)
f_stat = (ssb/df_ssb)/(ssw/df_ssw)
f_stat

crit = qf(0.05,(m-1),(m*n-m),lower.tail = F)

# reject null hypo 
