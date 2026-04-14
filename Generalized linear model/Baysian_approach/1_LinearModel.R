
library(dplyr)
library(tidyr)
library(plyr)
library(rstan)
library(ggplot2)
#library(cowplot)

R code
#並列計算するにはstan関数やstan_model関数とsampling関数を呼ぶ前に以下のコードを書く
rstan_options(auto_write = TRUE)
options(mc.cores = parallel::detectCores())



data_list_ww <- list(N = sample_size, x = data$infected, y = concentation)

rstan_options(auto_write = TRUE)
options(mc.cores = parallel::detectCores())

mcmc <- stan(
  file = "1_LinearModel.stan", 
  data = data_list_ww,
  seed = 1,
  chain = 4,
  iter = 10000,
  warmup = 5000,
  thin = 4
)


