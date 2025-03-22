# Cohort study
##Power for comparing two independent proportions (two sample study, cohort study)
##Assume that 5% of the non-smokers will develop coronary heart disease during the study. You would like your study to have adequate power to detect a relative risk of 2.0. 

#P2 = 0.05%
#P1 = 0.10 % given that relative risk of 2.0
#Given a prevalence of smoking 0.25 (This is assumption from literature review), which represents k = 3 ((1-0.25)/0.25). K is ratio of exposure group to non exposure group.

power_prop_test(n = NULL, p1 =0.1, p2 = 0.05, sig.level = 0.05, power = 0.9, ratio = 3, alternative = “one.sided”) 
#p1 and p2 already known



# Case-Control study
##Assume that approximately 30% of women of child-bearing age will have an exposure to oral contraceptives. You would like your case-control study to have 90% power to detect an odds ratio of 3.0 at the a = 0.05 level. How many women are needed assuming a 1:1 ratio of cases to controls?  

#P2 = 0.3
#Odd = P1*(1-P1)(P2*(1-P2)
#P1 = 0.5625

power_prop_test(n = NULL, p1 =0.5625, p2 = 0.05, sig.level = 0.05, power = 0.9, ratio = 1, alternative = “one.sided”)
