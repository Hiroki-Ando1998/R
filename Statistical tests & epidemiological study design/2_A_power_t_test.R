#Question:
#Plasma-glucose levels are used to determine the presence of diabetes. Suppose the mean ln (plasma-glucose) concentration (mg/dL) in 35- to 44-year-olds is 4.86 with standard deviation = 0.54. A study of 100 sedentary people in this age group is planned to test whether they have a higher or lower level of plasma glucose than the general population.  


#If you want know unknown
d <- 0.1/0.54
pwr.t.test(n = 200, d = d, sig.level = 0.05, power = NULL)

# If you want to know sample size
d <- 0.1/0.54
pwr.t.test(n = NULL, d = d, sig.level = 0.05, power = 0.80)
