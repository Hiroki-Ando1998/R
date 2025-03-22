### Case-Control (Matching) study
#Suppose we are interested in comparing the effectiveness of two different antibiotics, A and B, in treating gonorrhea. Each person receiving antibiotic A is matched with an equivalent person (age within 5 years, same gender), to whom antibiotic B is given. These people are asked to return to the clinic within 1 week to see if the gonorrhea has been eliminated. Suppose the results are as follows: (a) for 40 pairs of people, both antibiotics are successful; (b) for 20 pairs of people, antibiotic A is effective whereas antibiotic B is not; (c) for 16 pairs of people, antibiotic B is effective whereas antibiotic A is not; (d) for 3 pairs of people, neither antibiotic is effective. How many matched pairs should be enrolled in a future study if we wish to conduct a two-sided test with  = 0.05 and power = 0.80?

P12 <- 20/79 (79 is total pair sample) = 0.2025
P21 <- 16/79 = 0.2532
power.mcnemar_test(n = NULL, paid =0.2025, psi = 0.2532/0.2025, sig.level = 0.05, power = 0.9, ratio = 1, alternative = “two.sided”, method = “normal)
