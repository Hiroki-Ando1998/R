res_lm <- lm (Y ~ X + as.factor(D), data = d) 

#Regression and confidence interval
X_new <- data.frame(X = 23:60)
Conf <- predict(res_lm, X_new, interval = ‘confidence’, level = 0.95)
Conf <- predict(res_lm, X_new, interval = ‘prediction’, level = 0.95)
