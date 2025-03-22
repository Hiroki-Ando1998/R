res_lm <-  lm(Y ~ X + males + X*males, data = data)

#Studentized residual (for simple linear regression, r have a student’s t distribution with n-3 degree)
# r >|2| are considered influential

dia <- influence(res_lm)
boxplot(dia$hat)
 
library(MASS)
data <- fev
data$blev <- dia$hat
data$bstd <- studres(lm_model)
data <- data2[order(-data$bstd), ]
data [abs(data$bstd >2,)

#Cook’s distance >4/n is considered influential for simple linear regression.
#Note that leverage, studentized residual and Cook’s distance are particularly useful in the multivariate situation when visual inspection is not possible
# (1)Figure
data3 <- fev 
data3$blev <- dia$hat 
data3$bstd <- studres(lr3) 
data3$cooksd <- cooks.distance(lr3) 
boxplot(data3$cooksd) 
#(2) re-order
data3 <- data3[order(-data3$cooksd), ] 
data3[data3$cooksd > 4/length(data3$cooksd), ]
