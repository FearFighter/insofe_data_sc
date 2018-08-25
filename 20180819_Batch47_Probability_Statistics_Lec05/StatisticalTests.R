setwd("D:/batch 45/CSE 7315c/Day05")

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

# 2-sample UNPAIRED t-test

rifampicinT <- c(1.15, 1.15, 0.92, 1.28, 0.72, 0.67, 1, 0.79,
                 0.76, 0.95, 0.67, 0.82, 1.06, 1.21, 0.82)
rifampicinC <- c(0.81, 0.56, 0.46, 1.06, 0.45, 0.43, 0.43,
                 0.88, 0.37, 0.54, 0.73, 0.73, 0.68, 0.43, 0.93)
ttest2U <- t.test(rifampicinT,rifampicinC, conf.level = 0.95,
                 var.equal = TRUE)
ttest2U

# 2-sample PAIRED t-test

treatmentA <- c(145,130,120,132,132,132,142,120,138,135,
                138,135,125,135,135,135,135,132,130,120,
                125,130,135,135,135,140,130)
treatmentB <- c(120,135,120,125,125,135,123,128,128,122,
                130,120,130,125,122,125,125,120,120,125,
                120,130,125,120,118,118,125)
ttest2P <- t.test(treatmentA, treatmentB, paired = TRUE, conf.level = 0.95)
ttest2P

# Critical chi-square value at a specified confidence level and degrees of freedom
qchisq(0.95,4)
qchisq(0.99,4)

# Critical F value at a specified confidence level and degrees of freedom
qf(0.025,9,11,lower.tail = FALSE)
qf(0.025,9,11)
qf(0.975,9,11,lower.tail = FALSE)
qf(0.975,9,11)
qf(0.9,2,24)