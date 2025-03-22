lm_model <- lm(data = fev, logfev ~ Age + Hgt + sex + smoke)

cor.test(data = fev, Age, Hgt)
librarty(car)
vif(lm_model) 
