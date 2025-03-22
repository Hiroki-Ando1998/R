#χ2 test
chisq.test(matrix)

#Fisher exact test
matrix(c(103, 43, 33, 117), nrow=2, byrow = TRUE,
dimnames =list(Season = c("summer", "winter"), Test =c("Positive", "Negative")))
fisher.test(matrix)
