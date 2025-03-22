lo_2 <- glm(chd ~ age + chol + sex + as.factor(lvh) + weight + + as.factor(u_sug) + sbp + dbp + height + gl_int, + data = fram_sub, family = binomial(link = "logit"))

#Back elimination approach
lo2_select <- step(lo_2, direction = “backward”)

#Select models
lo2_final <- glm(chd ~ age + chol + sex + as.factor(lvh) + weight + + sbp + gl_int, data = fram_sub, family = binomial(link = "logit"))
 
#Hosmer-Lemeshow Test
library(ResourceSelection)
hoslem.test(fram_sub$chd, fitted(log2_final), g = 10)
