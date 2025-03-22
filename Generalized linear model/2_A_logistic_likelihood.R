#Date frame
ex_1 <- c(rep(c(0, 1, 1), 120), rep(c(0, 1, 0), 80), + rep(c(0, 0, 1), 111), rep(c(0, 0, 0), 155), + rep(c(1, 1, 1), 161), rep(c(1, 1, 0), 130), + rep(c(1, 0, 1), 117), rep(c(1, 0, 0), 124))
ex_1 <- matrix(ex_1, ncol = 3, byrow = TRUE)
ex_1 <- data.frame(ex_1)
colnames(ex_1) <- c("personal", "passive", "disease")
table(ex_1)

#Regression model
lo_1 <- glm(disease ~ passive, data = ex_1[ex_1$personal ==0, ], family = binomial(link = “logit”))
‘summary(lo_1)
 
Lo_lred <- glm(disease ~ 1, data = ex_1[ex_1$personal == 0, ], family = binomial(link = “logit”)[AH2] 
 
#The likelihood ratio test
library(mdscore)
lr.test(lo_lred, lo_1)
 
#compute the odds ratio
library(oddsratio)
or_glm(ex_1, lo_1, incr = list(passive = 1))
