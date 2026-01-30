
setwd("C:/WBE_risk_assessment")

library(dplyr)
library(tidyr)
library(plyr)
library(ggplot2)
library(rstan)
library(stats)
library(bayesplot)


#data_IAV <- read.csv("Realworlddata_IAV.csv")
#data_IAV_2 <- read.csv("Realworlddata_IAV_2.csv")
data_SARS <- read.csv("Realworlddata_SARS.csv")
threshold <- 1.0




#SARS-CoV-2
data_stan <- data_SARS[1:(nrow(data_SARS)),]#170
sample_size <- nrow(data_stan)
data_row_CD <- data.frame(true = which(!is.na(data_stan$positive) & data_stan$test >= 3)) #pick row numbers for censored data
sample_size_CD <- nrow(data_row_CD)
data_row_D <- data.frame(detected = which(data_stan$positive >= data_stan$test*threshold & data_stan$test >= 3)) #pick row numbers of detected data
sample_size_D <- nrow(data_row_D)
data_row_case <- data.frame(true = which(!is.na(data_stan$case))) #pick row numbers for censored data
sample_size_case <- nrow(data_row_case)
data_row_hos <- data.frame(true = which(!is.na(data_stan$hospitalization))) #pick row numbers for censored data
sample_size_hos <- nrow(data_row_hos)



data_ww <- data_stan %>% filter(positive >= test*threshold & test >= 3) #####
ww <- data_ww$ww
data_nd <- data_stan %>% filter(test >= 3)
ND <- data_nd$positive
ND_test <- data_nd$test

data_cli <- data_stan %>% drop_na(case) 
cli <- data_cli$case

data_hos <- data_stan %>% drop_na(hospitalization) 
hos <- data_hos$hospitalization

shedding_time <- data.frame(values = 1:25)
n2 <- nrow(shedding_time)

data_list_ww <- list(n_all = sample_size, n_cd = sample_size_CD, n_d = sample_size_D,n_case = sample_size_case, n_hos = sample_size_hos,
                     WBE = ww, nd = ND, nd_test = ND_test,
                     reported_case = cli, hos = hos,
                     row_cd = data_row_CD$true, row_d = data_row_D$detected, row_case = data_row_case$true, row_hos = data_row_hos$true,
                     nb = n2, t = shedding_time$values) #size = tested sample, nb; shedding period


rstan_options(auto_write = TRUE)
options(mc.cores = parallel::detectCores())
mcmc_7 <- stan(
  file = "20260123_Risk_assessment_realworld_SARS.stan",
  data = data_list_ww,
  seed = 1,
  chain = 8,
  iter = 30000,
  warmup = 15000,
  thin = 3, #  
  #init = init_list,
  control = list(max_treedepth = 10, adapt_delta = 0.9)
)

print(mcmc_7, pars = c("sigma_1", "sigma_3", "A", "a", "b", "shed_interval", "shed_shape", "sigma_CAR", "shedding_diff", "shedding_diff_2", "shedding_mean", "shedding_variance"), probe = c(0.025, 0.50, 0.975))
#print(mcmc_7, pars = c("sigma_1", "sigma_3", "A", "a", "b", "shed_interval", "shed_shape", "sigma_CAR", "shedding_diff", "shedding_diff_2", "shedding_mean", "shedding_variance", "phi"), probe = c(0.025, 0.50, 0.975))
#print(mcmc_7, probe = c(0.025, 0.50, 0.975))


#---------------------------------------------------------------------------------------------------------------------------------- パラメータ名
pars <- c(
  "sigma_1", "sigma_3", "A", "a", "b",
  "shed_interval", "shed_shape", "sigma_CAR",
  "shedding_diff", "shedding_diff_2",
  "shedding_mean", "shedding_variance"
)

# summary を取得
sum_mcmc <- summary(
  mcmc_7,
  pars = pars,
  probs = c(0.025, 0.25, 0.5, 0.75, 0.975)
)

# 行列を data.frame に
df_parameter <- as.data.frame(sum_mcmc$summary)

# パラメータ名を列として保存
df_parameter$parameter <- rownames(df_parameter)
df_parameter <- df_parameter[, c("parameter", colnames(df_parameter)[1:(ncol(df_parameter)-1)])]
#---------------------------------------------------------------------------------------------------------------------------------- パラメータ名



#width: 1300, hight: 2000)
# p <- mcmc_combo(mcmc_7, pars = c("sigma_1", "sigma_3", "A", "a", "b", "shed_interval", "shed_shape", "sigma_CAR", "shedding_diff", "shedding_diff_2", "shedding_mean", "shedding_variance"))
# p <- mcmc_combo(mcmc_7, pars = c("sigma_1", "sigma_3", "A", "a", "b", "shed_interval", "shed_shape", "sigma_CAR", "shedding_diff", "shedding_diff_2", "shedding_mean", "shedding_variance", "phi"))

mcmc_sample <- rstan::extract(mcmc_7)
state_name <- "Re" #状態の名前：stan fileを参照すること
result_Re_7 <- data.frame(t(apply(
  X = mcmc_sample[[state_name]][, 44:ncol(mcmc_sample[[state_name]])],
  MARGIN = 2,
  FUN = quantile,
  probs = c(0.025, 0.5, 0.975)
)))

colnames(result_Re_7) <- c("Re_low_7", "Re_med_7", "Re_upr_7")

state_name <- "generated_i1" #状態の名前：stan fileを参照すること
result_i1_7 <- data.frame(t(apply(
  X = mcmc_sample[[state_name]][, 44:ncol(mcmc_sample[[state_name]])],  # 11列目から最後の列までを指定
  MARGIN = 2,
  FUN = quantile,
  probs = c(0.025, 0.5, 0.975)
)))

colnames(result_i1_7) <- c("i1_low_7", "i1_med_7", "i1_upr_7")

state_name <- "generated_ww" #状態の名前：stan fileを参照すること
result_ww_7 <- data.frame(t(apply(
  X = mcmc_sample[[state_name]][, 44:ncol(mcmc_sample[[state_name]])],  # 44列目から最後の列までを指定
  MARGIN = 2,
  FUN = quantile,
  probs = c(0.025, 0.5, 0.975)
)))

colnames(result_ww_7) <- c("ww_low_7", "ww_med_7", "ww_upr_7")



state_name <- "CAR" #状態の名前：stan fileを参照すること
result_CAR_7 <- data.frame(t(apply(
  X = mcmc_sample[[state_name]][, 44:ncol(mcmc_sample[[state_name]])],  
  MARGIN = 2,
  FUN = quantile,
  probs = c(0.025, 0.5, 0.975)
)))

colnames(result_CAR_7) <- c("CAR_low_7", "CAR_med_7", "CAR_upr_7")


state_name <- "generated_i1_daily_total_report_2" #状態の名前：stan fileを参照すること
result_report_case_7 <- data.frame(t(apply(
  X = mcmc_sample[[state_name]][, 44:ncol(mcmc_sample[[state_name]])],  
  MARGIN = 2,
  FUN = quantile,
  probs = c(0.025, 0.5, 0.975)
)))

colnames(result_report_case_7) <- c("case_low_7", "case_med_7", "case_upr_7")

state_name <- "generated_i1_daily_total_hospital_2" #状態の名前：stan fileを参照すること
result_report_hos_7 <- data.frame(t(apply(
  X = mcmc_sample[[state_name]][, 44:ncol(mcmc_sample[[state_name]])],  
  MARGIN = 2,
  FUN = quantile,
  probs = c(0.025, 0.5, 0.975)
)))

colnames(result_report_hos_7) <- c("hos_low_7", "hos_med_7", "hos_upr_7")



data_compare <- data_stan[44:nrow(data_stan),]
data_result_7 <- cbind(data_compare, result_Re_7, result_i1_7, result_ww_7, result_CAR_7, result_report_case_7, result_report_hos_7)
#View(data_result_7)





state_name <- "generated_feces_1" #状態の名前：stan fileを参照すること
result_feces_7 <- data.frame(t(apply(
  X = mcmc_sample[[state_name]],
  MARGIN = 2,
  FUN = quantile,
  probs = c(0.025, 0.5, 0.975)
)))

colnames(result_feces_7) <- c("feces_low_7", "feces_med_7", "feces_upr_7")



#shedding onset distribution
shedding_onset <- as.numeric(mcmc_sample$gamma1_sample)
incubation_time <- as.numeric(mcmc_sample$gamma2_sample)

data_shedding_onset <- data.frame(
  shedding_onset = shedding_onset,
  incubation_time = incubation_time
)

# 欠損値の削除
data_shedding_onset <- na.omit(data_shedding_onset)

# プロット作成 375*220
plot <- ggplot(data_shedding_onset) +
  geom_density(aes(x = incubation_time), fill = "#FEC44F", alpha = 0.5) +
  geom_density(aes(x = shedding_onset), fill = "#0570B0", alpha = 0.5) +
  labs(x = "day", y = "Probability density") +
  scale_y_continuous(limits = c(0.0, 0.5), breaks = seq(0.0, 0.5, 0.1)) +
  scale_x_continuous(limits = c(-1, 15), breaks = seq(0.0, 15, 10)) +
  theme_bw() +
  theme(
    axis.line = element_line(linewidth = 1.0, lineend = "square"),
    text = element_text(colour = "black", size = 14),
    legend.position = "none",
    axis.ticks = element_line(linewidth = 1.0),
    axis.ticks.length = unit(-2, "mm")
  )

print(plot)

ggsave(
  filename = "/home/u31/hirokiando/20260123_shedding_plot.svg",
  plot = plot,
  device = grDevices::svg,
  width  = 375 / 72,
  height = 220 / 72,
  units  = "in"
)



#---------------------------------------------------------------------------------------------------
state_name_1 <- "generated_i1"
samples_i1 <- mcmc_sample[[state_name_1]]
samples_i1 <- samples_i1[, 44:ncol(samples_i1)]
samples_i1 <- samples_i1[seq(3, nrow(samples_i1), by = 100), ] ## 各列の80の倍数の行のみ抽出

state_name_2 <- "Re"
samples_Re <- mcmc_sample[[state_name_2]]
samples_Re <- samples_Re[, 44:ncol(samples_Re)]
samples_Re <- samples_Re[seq(3, nrow(samples_Re), by = 100), ] ## 各列の80の倍数の行のみ抽出


# CSV に書き出し
write.csv(df_parameter, file = "/home/u31/hirokiando/20260123_Parameters.csv", row.names = FALSE)
write.csv(x = data_result_7, file = "/home/u31/hirokiando/20260123_result_7_SARS.csv")
write.csv(x = result_feces_7, file = "/home/u31/hirokiando/20260123_result_shedding_SARS.csv")
write.csv(samples_i1, file = "/home/u31/hirokiando/20260123_generated_2_i1_samples.csv", row.names = FALSE)
write.csv(samples_Re, file = "/home/u31/hirokiando/20260123_generated_2_Re_samples.csv", row.names = FALSE)

