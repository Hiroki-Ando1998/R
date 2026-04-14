mean(data$aA, na.rm = TRUE) #exclude NA
median()
mode()
max()
min()
# unbiased variance 
var()
sd(data, na.rm = FALSE)
covariance <- cov(c1, c2)

#Correlation coefficient
cor.test(data_1$hospital, data_1$sapporo, method = "pearson")
cor.test(data_1$hospital, data_1$sapporo, method = "spearman")
