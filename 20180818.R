
# 1
# A population of 25-28 year-old males has a mean salary of $29,321 with a standard
# deviation of $2,120. If a sample of 100 men is taken, what is the probability their
# mean salaries will be less than $29,000?

mean = 29321
sigma = 2120
n=
  
x = 29000
#p(xbar < 29000)
se = sigma/sqrt(n) # standard erro / std dev of sample
se
zscore = (x-mean)/se
zscore
prob = pnorm(zscore)
prob
 
# alternative
pnorm(x,mean,se)

# 2
# The engines made by Ford for speedboats had an average power of 220
# horsepower (HP) and standard deviation of 15 HP. A potential buyer intends to
# take a sample of forty engines and will not place an order if the sample mean is
# less than 215 HP. What is the probability that the buyer will not place an order?
  
avg = 220
sd = 15
n = 40
x = 215
# p(x < 215) ?
se = sd/sqrt(n)
se
z = (x-avg)/se
z
prob  = pnorm(z)
prob

# alternative
pnorm(x,avg,se)

# 3
# A random sample of 225 ROTE exams was selected from the past 25 batches and the
# number of students absent from each was recorded. We got the average absences as 11.6
# with 4.1 standard deviation. Estimate the 90% confidence interval for mean number of
# absences per tutorial over the past 25 batches. 


n=225
# n = 25
mean_sample = 11.6
sd = 4.1

# get the point at 95% on right side cut off of 90%
z = qnorm(0.95) # here it assumes mean is 0 and sd = 1
z

# since population sd is not given assume sample sd as population sd
se = sd/sqrt(n)
se
# margin of error = z * se
# ci lower = mean - margin of error
ci_lower = mean_sample - (z*se)
ci_upper = mean_sample + (z*se)
ci_lower
ci_upper






# 4. A random sample of 100 items is taken, producing a sample mean of 49. The
# population std. deviation is: 4.49. Construct a 90% confidence interval to estimate
# the population mean.
n=100
xbar = 49
sd = 4.49

z = qnorm(0.95)
z
se = sd/sqrt(n)
se
ci_lower = xbar - (z*se)
ci_upper = xbar+(z*se)
ci_lower
ci_upper


# 5. The life in hours of a 75- watt light bulb is known to be normally distributed
# with σ = 25 hours. A random sample of 100 bulbs has a mean life of x´ = 1014
# hours. Construct a 95 % confidence interval on the mean life.

sd = 25
n=100
xbar = 1014

z = qnorm(0.975)
z
se = sd/sqrt(100)
se
ci_lower = xbar - (z*se)
ci_upper = xbar + (z*se)
ci_lower
ci_upper


# 6. Click fraud has become a major concern as more and more companies
# advertise on the internet. When Google places an ad for a company with its
# search results, the company pays a fee to Google each time someone clicks on the
# link. That’s fine when it’s a person who’s interested in buying a product or service,
# but not so good when it’s a computer program pretending to be a customer. An
# analysis of 1200 clicks coming into a company’s site during a week identified that
# 175 of these clicks are fraudulent. Compute the confidence interval with 95%
# confidence for the proportion of fraudulent clicks. 


# this is binomial dist
# for binogmial dist sigma = sqrt(pq)

n = 1200
r = 175
p = r/n
q = 1-p
z = qnorm(0.975)

ci_lower = p - (z * sqrt((p*q/n)))
ci_upper = p + (z * sqrt((p*q/n)))
ci_lower
ci_upper
clicks_lower = ci_lower*1200
clicks_upper = ci_upper*1200
clicks_lower
clicks_upper

#


# 7. State the null and alternative hypotheses to be used in testing the following claims
# and determine generally where the critical region is located:
#   a. The mean snowfall at Lake George during the month of February is 21.8
# centimetres

z = qnorm(0.95)
z

# b. No more than 20% of the faculty at the local university contributed to the
# annual giving fund.
z = qnorm(0.95)
z


# 8. Suppose a manufacturer claims that the mean lifetime of a light bulb is at least
# 10,000 hours. In a sample of 30 light bulbs, it was found that they only last 9,900
# hours on average. Assuming the population standard deviation to be 120 hours, at
# 0.05 significance level, can we reject the claim by the manufacturer?

n=30
xbar = 9900
mean = 10000
sd = 120
sig_lvl = 0.05
z = qnorm(0.05)
z
t = (xbar-mean)/(sd/sqrt(n))
t

# since t value(test statistic) -4.56 is left side of z critical -1.64, reject the null hypothesis with 5% level of significance



