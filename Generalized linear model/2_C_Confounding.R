crude_ex2_f <- glm(bw ~ smoking, data = ex_2, family = binomial(link = “logit”))
or_glm(ex_2, crude_ex2_f, incr = list(smoking = 1))

“Compare crude odds ratio with adjusted odds ratio (no interaction model)
