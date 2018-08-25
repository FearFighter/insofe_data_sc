setwd("D:/batch 45/CSE 7315c/Day04")
qnorm (0.9641,0,1)
1-pnorm(1.86,0,1)

# Serum Cholesterol
1-pnorm(230, 211, 46)
1-pnorm(230, 211, 46/sqrt(25))
pnorm(2.33, 0, 1)

# Biased or unbiased coin
pbinom(14,20,0.5, lower.tail = FALSE, log.p = FALSE)

# Dr. Unsnora
pbinom(11,15,0.9, lower.tail = TRUE, log.p = FALSE)
pbinom(80,100,0.9, lower.tail = TRUE, log.p = FALSE)

# Confidence Intervals in t-distribution
dosage <- c(98.6, 102.1, 100.7, 102, 97, 103.4, 98.9, 101.6, 102.9, 105.2)
dosage
sd(dosage)
ttest <- t.test(dosage, conf.level = 0.95, mu = 100)
ttest
ttest$statistic
ttest$parameter
ttest$conf.int
ttest$p.value
ttest$estimate
ttest$null.value
ttest$alternative
ttest$method
ttest$data.name
pt(1.5824,9)

# Critical t value at a specified confidence level and degrees of freedom
conf.level = 0.90
df = 17
qt((1-conf.level)/2, df)
qt(0.025,24)
qt(0.025, 19)
qt(0.975, 19)

z = qnorm((1 - conf.level)/2, lower.tail = FALSE)
xbar = 80
sdx = 4
c(xbar - z * sdx, xbar + z * sdx)
