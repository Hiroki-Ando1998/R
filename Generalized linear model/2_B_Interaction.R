lo_f <- glm(disease ~ passive*personal, data = ex_1, family = binomial(link = “logit”))
summary(lo_1)

or_glm(ex_1, lo_f, incr = list(passive = 1, personal = 1, inter = 1)

#compare it to reduced model without interaction

lo_fred <- glm(disease ~ passive + personal, dta = ex_1, familiy = binomial(link = “logit”))
lr.test (lo_fred, lo_f)

#Reject the null hypothesis (β3 = 0) since P < 0.10→report odds ratio in stratified group

or_glm(ex_1, lo_f)
