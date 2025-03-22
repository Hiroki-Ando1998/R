#ANOVA, Krustical-wallis test
anova_result <- summary(aov(Bilsecpt ~ Hormone,data = data_3))
print(anova_result)

kruskal.test(adj ~ A, data = data)
