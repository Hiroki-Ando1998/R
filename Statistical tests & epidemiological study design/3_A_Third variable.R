# Create matrix
data <- c(rep(c(0, 1, 1), 120), rep(c(0, 1, 0), 80), rep(c(0, 0, 1), 111), rep(c(0, 1, 0), 155),
rep(c(1, 1, 1), 161), rep(c(1, 1, 0), 130), rep(c(0, 0, 1), 117), rep(c(0, 1, 0), 124)
data <- matrix(data, ncol = 3, byrow = TRUE)
data <- data.frame(data)
colnames(data) <- c(“personal”, “passive”, “disease”)
 
library(EpiStats)
library(dplyr)
library(knitr)

#Odds ratio stratified 
res1 <- CC(data[data$personal == 0, ], cases = “disease”, exposure = “passive”, exact = TRUE, full = TRUE)
kable(res1$df1, align = “r”)
kable(res1$df2, align = res1$df2.align)
res2 <- CC(d1[d1$personal == 1, ], cases = “disease”, exposure = “passive”, exact = TRUE, full = TRUE)
kable(res2$df1, align = “r”)
kable(res2$df2, align = res2$df2.align)

# Test for whether the two odds ratios differ (Woolf’s test for interaction)
# CCinter: Case-control interaction
res <- CCInter(data, cases = ”disease”, exposure = “passive”, by = “personal”, full = TRUE)
kable(res$df2)

#Test for association assuming no interaction (Mantel-Haenszel χ2 test)
The test should be used only when if the variance V > 5 (χ2 test)
#行列の作成
data <- array(c(98, 832, 169, 3520, + 54, 227, 55, 686, + 11, 85, 61, 926, + 7, 102, 90, 1936), + dim = c(2, 2, 4), + dimnames = list( + Exposure = c("1", "0"), + Response = c("1", "0"), + Race.Level = c("1", "2", "3", "4"))) 
mantelhaen.test(data, correct = FALSE)
 
res4 <- CC(d2, cases = “bw”, exposure = “smoking”, exact = TRUE, full = TRUE)
kable(res4$df2, align = res4$df2.align)
