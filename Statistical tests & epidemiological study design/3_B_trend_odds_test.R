#χ2 test (used only if variance is >5) Homogeneity 

disease <- c(320, 1206, 1011, 463, 220)
no_disease <- c(1422, 4432, 2893, 1092, 406)
n <- c(1742, 5683, 3904, 1555, 626)
m <- as.table(cbind(no_disease, disease))
damnames(m) <- list(age = c(“1”, “2”, “3”, “4”, “5”)), + disease = c(“N”, “Y”)
chisq.test(m)
 
# test for trend
prop.trend.test(disease, n, score = seq_along(disease))

#Since p < 0.001, we reject the null hypothesis and conclude that there is a linear trend in the odds


#Maternal extension test
#Goal is to determine whether there is a linear trend in the odds ratios across levels of an (ordinal) risk factor after controlling for a confounder.

mantelhaen(table)


