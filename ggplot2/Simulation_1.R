setwd("C:/time_lag_analysis")

library(deSolve)
library(dplyr)
library(tidyr)
library(plyr)
library(ggplot2)
library(rstan)
library(stats)

#incubation time
gamma_function <- function(x, shape, rate) {
  return((rate^shape) * (x^(shape - 1)) * exp(-rate * x) / gamma(shape))
}
gamma_probability <- function(lower, upper, shape, rate) {
  integrate(gamma_function, lower = lower, upper = upper, shape = shape, rate = rate)$value
}
shape <- 3  
rate <- 1   
prob <- NULL
for(i in 0:7){
  probability <- gamma_probability(i, i + 1, shape, rate)
  prob <- c(prob, probability) 
}
gamma_prob <- data.frame(prob)


#shedding start 
#mean_2: (2.45, 1.6), (0.395 , 0.28), (0.10, 0.07)
#mean_3: (6.15, 2.48), (0.57, 0.237)
#mean_4: (12.3, 3.54), (1.425, 0.4025)
shape <- 2.45
rate <- 1.6
prob <- NULL
for(i in 0:9){
  probability <- gamma_probability(i, i + 1, shape, rate)
  prob <- c(prob, probability) 
}
time <- seq(1, 10)
gamma_prob_shed <- data.frame(time = time, prob = prob)
mean_shed_1 <- mutate(gamma_prob_shed, sum = time * prob, sum_2 = time * time*prob)
sum(mean_shed_1$sum)
sqrt(sum(mean_shed_1$sum_2)-sum(mean_shed_1$sum)^2)





# SIRS
sirs_model <- function(time, state, parameters) {
  with(as.list(c(state, parameters)), {
    # tが100未満の場合、100から150の間、150以上の場合でbetaの値を変更する
    if (time < 35) {
      beta_value <- beta
    } else if (time >= 35 & time < 60) {
      beta_value <- beta/1 #3
    } else {
      beta_value <- beta*1 #2
    }
    
    dS <- -beta_value * S * I + alpha*R
    dI <- beta_value * S * I - gamma * I
    dR <- gamma * I -  alpha*R
    return(list(c(dS, dI, dR)))
  })
}


# 初期値
population <- 100000
A <- 10/population
initial_state <- c(S = 1 - A, I = A, R = 0)

# パラメータ
beta_1 <- 1/3*1.20
gamma_1 <- 1/3
alpha_1 <- 1/90
parameters <- c(beta = beta_1, gamma = gamma_1, alpha = alpha_1) 
times <- seq(0, 350, by = 1)

# モデルを解く
output <- ode(y = initial_state, times = times, func = sirs_model, parms = parameters)

data_sim <- data.frame(output)


#新規感染者数に変換
incidence <- NULL
incidence <- A
run <- nrow(data_sim)

for(i in 1:run-1){
  n_incidence <- (data_sim$S[i]) *(data_sim$I[i]) * beta_1 #beta is constant
  incidence <- c(incidence, n_incidence) 
}

data_sim_incidence <- data.frame(incidence)
data_sim_2 <- cbind(data_sim, incidence)
data_sim_2 <- data_sim_2 %>% mutate(incidence_2 = incidence*population)


#confirmed case
data_xx <- mutate(data_sim_2, confirmed = lag(incidence_2, 6)) #infected people will be detected 6 days after infection



#Wasteawter-based data
shedding <- numeric()
run_4 <- nrow(data_xx)
run_5 <- nrow(gamma_prob_shed)
for(i in (run_5+1):run_4){
  n_shedding_2 <-0
  for(m in 1:run_5){
    n_shedding_1 <- data_xx$incidence_2[i-m]*gamma_prob_shed$prob[m]
    n_shedding_2 <- n_shedding_2 + n_shedding_1
  }
  shedding <- c(shedding, n_shedding_2) 
}
data_shedding <- data.frame(shedding)

zeros_shedding <- rep(0,run_5)
data_b_2_shedding <- data.frame(shedding = zeros_shedding)
data_shedding <- rbind(data_b_2_shedding, data_shedding)

data_xx_4 <- cbind(data_xx, data_shedding)



#wastewater concentration
data_shedding <- read.csv("time_lag_analysis_Assumed_shedding.csv")
wastewater <- numeric()
run_6 <- nrow(data_xx_4)
for(i in 26:run_6){
  n_wastewater_2 <-0
  for(m in 1:25){
    n_wastewater_1 <- data_xx_4$shedding[i-m+1]*data_shedding$middle[m] #rapid, middle, prolong, super_rapid
    n_wastewater_2 <- n_wastewater_2 + n_wastewater_1
  }
  wastewater <- c(wastewater, n_wastewater_2) 
}
data_waste <- data.frame(wastewater)

zeros_1_b <- rep(0,25)
zeros_2 <- rep(0,1)
data_b_2 <- data.frame(wastewater = zeros_1_b)
data_b_3 <- data.frame(wastewater = zeros_2)
data_waste_2 <- rbind(data_b_2, data_waste)
data_xx_5 <- cbind(data_xx_4, data_waste_2)





#Final data & figure
data_xx_final_1 <- data_xx_5[36:nrow(data_xx_5),] #


plot <- ggplot(data_xx_final_1, aes(x = time)) 
plot <- plot + geom_point(aes(y = incidence_2), color = "#0570B0", size = 1) 
plot <- plot + geom_point(aes(y = confirmed), color = "#3690C0", size = 1) 
plot <- plot + geom_point(aes(y = shedding), color = "#980043", size = 1) 
plot <- plot + labs(x = "day", y = "incidence")
plot <- plot + theme_classic()
plot <- plot + theme(
  axis.line = element_line(linewidth = 1.0, lineend = "square"),
  text = element_text(colour ="black", size = 14),
  legend.position = "none",
  axis.ticks = element_line(linewidth = 1.5),
  axis.ticks.length = unit(-2, "mm"))
plot

#write.csv(x = data_xx_final_1, file = "C:/time_lag_analysis/data_1.csv")


plot_ww <- ggplot(data_xx_final_1, aes(x = time))  
plot_ww <- plot_ww + geom_point(aes(y = log10(wastewater)), color = "#0570B0", size = 1) 
plot_ww <- plot_ww + labs(x = "day", y = "wastewater concentration")
plot_ww <- plot_ww + theme_classic()
plot_ww <- plot_ww + theme(
  axis.line = element_line(linewidth = 1.0, lineend = "square"),
  text = element_text(colour ="black", size = 14),
  legend.position = "none",
  axis.ticks = element_line(linewidth = 1.5),
  axis.ticks.length = unit(-2, "mm"))
plot_ww


















data_xx_final <- mutate(data_xx_final_1, wastewater = log10(wastewater))
##simulation

lag_time <- numeric()
for(i in 1:5000){

#measurement errors for wastewater concentration
wastewater_err_t <- c()
wastewater_err_normal <- c()
run_7 <- nrow(data_xx_final)
sd_1 <- 0.3
for(i in 1:run_7){
  measured_2 <- data_xx_final$wastewater[i] + sd_1*rt(n = 1, df = 10^10) #mean = log10(data_xx_final$wastewater[i]), sd = sd_1
  wastewater_err_t <- c(wastewater_err_t, measured_2)
  measured_2_normal <- rnorm(n = 1, mean = data_xx_final$wastewater[i], sd = sd_1)
  wastewater_err_normal <- c(wastewater_err_normal, measured_2_normal)
}

data_measured_ww <- data.frame(wastewater_err_t, wastewater_err_normal)


#measurement errors for clinical data
#(1)confirmed_case_round
confirmed_err <- c()
for(i in 1:run_7){
  size <- 10
  prob <- size / (size + data_xx_final$confirmed[i])
  confirmed_err_2 <- rnbinom(n = 1, size = size, prob = prob)
  confirmed_err <- c(confirmed_err, confirmed_err_2) 
}

data_confirmed_err <- data.frame(confirmed_err)


data_xxx_1 <- cbind(data_xx_final, data_confirmed_err, data_measured_ww)
data_xxx_2 <- select(data_xxx_1, time, wastewater, wastewater_err_normal)
data_confirm <- select(data_xxx_1, time, confirmed)
#weekly sampling
data_xxx_3 <- data_xxx_2 
data_xxx_3[data_xxx_3$time %% 7 == 1 |data_xxx_3$time %% 7 == 2|data_xxx_3$time %% 7 == 3
            |data_xxx_3$time %% 7 == 4 |data_xxx_3$time %% 7 == 5 |data_xxx_3$time %% 7 == 6, ] <- NA
data_sampling_1 <- cbind(data_confirm, data_xxx_3)

#three times sampling
data_xxx_3 <- data_xxx_2 
data_xxx_3[data_xxx_3$time %% 7 == 1 |data_xxx_3$time %% 7 == 3
           |data_xxx_3$time %% 7 == 4 |data_xxx_3$time %% 7 == 6, ] <- NA
data_sampling_3 <- cbind(data_confirm, data_xxx_3)

#seven time sampling
data_sampling_7 <- cbind(data_confirm, data_xxx_2)







# With or without measurement errors
data_xxx_4 <- data_sampling_1 #data_sampling_1, data_sampling_3, data_sampling_7
data_xxx_5 <- select(data_xxx_4, confirmed, wastewater_err_normal)
data_xxx_5 <- mutate(data_xxx_4, wastewater = wastewater_err_normal)



# data_xxx_4: without measurement error, data_xxx_5; with measurement errors
data_xx_lead <- mutate(data_xxx_5, 
                       wastewater_1 = lag(wastewater, 1), wastewater_2 = lag(wastewater, 2), wastewater_3 = lag(wastewater, 3), wastewater_4 = lag(wastewater, 4),
                       wastewater_5 = lag(wastewater, 5), wastewater_6 = lag(wastewater, 6), wastewater_7 = lag(wastewater, 7), wastewater_8 = lag(wastewater, 8),
                       wastewater_9 = lag(wastewater, 9), wastewater_10 = lag(wastewater, 10), wastewater_11 = lag(wastewater, 11), wastewater_12 = lag(wastewater, 12))
data_xx_behind <- mutate(data_xxx_5, 
                         wastewater_x1 = lead(wastewater, 1), wastewater_x2 = lead(wastewater, 2), wastewater_x3 = lead(wastewater, 3),
                         wastewater_x4 = lead(wastewater, 4), wastewater_x5 = lead(wastewater, 5))



cx5 <- cor(data_xx_behind$wastewater_x5, log10(data_xx_lead$confirmed), use = "complete.obs", method = "pearson")
cx4 <- cor(data_xx_behind$wastewater_x4, log10(data_xx_lead$confirmed), use = "complete.obs", method = "pearson")
cx3 <- cor(data_xx_behind$wastewater_x3, log10(data_xx_lead$confirmed), use = "complete.obs", method = "pearson")
cx2 <- cor(data_xx_behind$wastewater_x2, log10(data_xx_lead$confirmed), use = "complete.obs", method = "pearson")
cx1 <- cor(data_xx_behind$wastewater_x1, log10(data_xx_lead$confirmed), use = "complete.obs", method = "pearson")
c0 <- cor(data_xx_lead$wastewater, log10(data_xx_lead$confirmed), use = "complete.obs", method = "pearson")
c1 <- cor(data_xx_lead$wastewater_1, log10(data_xx_lead$confirmed), use = "complete.obs", method = "pearson")
c2 <- cor(data_xx_lead$wastewater_2, log10(data_xx_lead$confirmed), use = "complete.obs", method = "pearson")
c3 <- cor(data_xx_lead$wastewater_3, log10(data_xx_lead$confirmed), use = "complete.obs", method = "pearson")
c4 <- cor(data_xx_lead$wastewater_4, log10(data_xx_lead$confirmed), use = "complete.obs", method = "pearson")
c5 <- cor(data_xx_lead$wastewater_5, log10(data_xx_lead$confirmed), use = "complete.obs", method = "pearson")
c6 <- cor(data_xx_lead$wastewater_6, log10(data_xx_lead$confirmed), use = "complete.obs", method = "pearson")
c7 <- cor(data_xx_lead$wastewater_7, log10(data_xx_lead$confirmed), use = "complete.obs", method = "pearson")
c8 <- cor(data_xx_lead$wastewater_8, log10(data_xx_lead$confirmed), use = "complete.obs", method = "pearson")
c9 <- cor(data_xx_lead$wastewater_9, log10(data_xx_lead$confirmed), use = "complete.obs", method = "pearson")
c10 <- cor(data_xx_lead$wastewater_10, log10(data_xx_lead$confirmed), use = "complete.obs", method = "pearson")
c11 <- cor(data_xx_lead$wastewater_11, log10(data_xx_lead$confirmed), use = "complete.obs", method = "pearson")
c12 <- cor(data_xx_lead$wastewater_12, log10(data_xx_lead$confirmed), use = "complete.obs", method = "pearson")


cc1 <- c(-4, -3, -2, -1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12)
cc2 <- c(cx4, cx3, cx2, cx1, c0, c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11, c12)
data_r <- data.frame(lag_time = cc1, cor_r = cc2)


#Determine a lag time maximizing the coefficient
lag_max <- data_r$lag_time[which.max(data_r$cor_r)]


lag_time <- c(lag_time, lag_max)


}


data_lag_time <- data.frame(lag_time)
mean(data_lag_time$lag_time)
sd(data_lag_time$lag_time)

# histogram for lag-time (Width: 250, height: 190)
plot_his <- ggplot(data_lag_time, aes(x = lag_time)) 
plot_his <- plot_his + geom_histogram(binwidth = 1, fill = "#3690C0", color = "#0570B0")
plot_his <- plot_his + scale_x_continuous(limits = c(-4, 12), breaks = seq(-4, 12, 4)) 
plot_his <- plot_his + labs(x = "leading time", y = "count")
plot_his <- plot_his + theme_bw()
plot_his <- plot_his + theme(
  axis.line = element_line(linewidth = 1.0, lineend = "square"),
  text = element_text(colour ="black", size = 14),
  axis.title = element_blank(),
  legend.position = "none",
  axis.ticks = element_line(linewidth = 1.5),
  axis.ticks.length = unit(-2, "mm"))
plot_his


#shedding dynamics; L133
#shedding onset; L1
#Measurement error: L209, L265, 269
#sampling frequency: L258














































plot_err <- ggplot(data_xx_final, aes(x = time)) 
plot_err <- plot_err + geom_point(aes(y = confirmed), color = "#3690C0", size = 1) 
plot_err <- plot_err + geom_point(aes(y = confirmed_err), color = "#980043", size = 1) 
plot_err <- plot_err + labs(x = "day", y = "incidence")
plot_err <- plot_err + theme_classic()
plot_err <- plot_err + theme(
  axis.line = element_line(linewidth = 1.0, lineend = "square"),
  text = element_text(colour ="black", size = 14),
  legend.position = "none",
  axis.ticks = element_line(linewidth = 1.5),
  axis.ticks.length = unit(-2, "mm"))
plot_err


plot_ww_err <- ggplot(data_xx_final, aes(x = time))  
plot_ww_err <- plot_ww_err + geom_point(aes(y = wastewater), color = "#0570B0", size = 1) 
plot_ww_err <- plot_ww_err + geom_point(aes(y = wastewater_err_t), color = "#0570B0", size = 1)
plot_ww_err <- plot_ww_err + geom_point(aes(y = wastewater_err_normal), color = "#980043", size = 1)
plot_ww_err <- plot_ww_err + labs(x = "day", y = "wastewater concentration")
plot_ww_err <- plot_ww_err + theme_classic()
plot_ww_err <- plot_ww_err + theme(
  axis.line = element_line(linewidth = 1.0, lineend = "square"),
  text = element_text(colour ="black", size = 14),
  legend.position = "none",
  axis.ticks = element_line(linewidth = 1.5),
  axis.ticks.length = unit(-2, "mm"))
plot_ww_err


#write.csv(x = data_xxx_1, file = "C:/time_lag_analysis/data_1_w.csv")





# x軸の範囲
x_vals <- seq(0, 10, length.out = 1000)

# 平均2, 分散1のガンマ分布
gamma1 <- data.frame(
  x = x_vals,
  density = dgamma(x_vals, shape = 4, scale = 0.5),
  group = "Mean=2, Var=1"
)

# 平均2, 分散3のガンマ分布
gamma2 <- data.frame(
  x = x_vals,
  density = dgamma(x_vals, shape = 1.333, scale = 1.5),
  group = "Mean=2, Var=3"
)

# データ結合
gamma_data <- bind_rows(gamma1, gamma2)

# プロット
ggplot(gamma_data, aes(x = x, y = density, color = group)) +
  geom_line(size = 1) +
  labs(title = "Gamma Distributions",
       x = "x", y = "Density") +
  theme_minimal()












