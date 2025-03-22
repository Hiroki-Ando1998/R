#χ2 test
chisq.test(matrix)

#effecti size for categorical data
condition1 <- c(30, 20, 50)
condition2 <- c(35, 30, 35)
x <- cbind( condition1, condition2 )
cramersV( x )

#Fisher exact test
matrix(c(103, 43, 33, 117), nrow=2, byrow = TRUE,
dimnames =list(Season = c("summer", "winter"), Test =c("Positive", "Negative")))
fisher.test(matrix)


#McNemar’s test
before <- c(89, 5)
after <- c(16, 90)
data_table <- matrix(c(before, after), nrow = 2, byrow = TRUE,
                     dimnames = list(Season = c("effective", "ineffective"),
                                     Test = c("effective", "ineffective")))
mcnemar.test(data_table)
