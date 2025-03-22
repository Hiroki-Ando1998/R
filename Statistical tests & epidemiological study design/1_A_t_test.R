#t test 
t.test(data, data, var.equal=TRUE, paired = FALSE)

#Wilcoxson
library(exactRankTests)
wilcoxson(x = data, y = data, paired = T)

#Effect size (https://www.statology.org/cohens-d-in-r/)
library(effsize)
cliff.delta(data, data)
cohens.d(data, data)
herges_g()



#likelihood
lr.test(A, B)



#ANOVA, Krustical-wallis test
anova_result <- summary(aov(Bilsecpt ~ Hormone,data = data_3))
print(anova_result)

kruskal.test(adj ~ A, data = data)



#effecti size for categorical data
condition1 <- c(30, 20, 50)
condition2 <- c(35, 30, 35)
x <- cbind( condition1
