

R code
print(mcmc, pars = c("c1", "intercept"), probe = c(0.025, 0.50, 0.975))

#Traceplot
library(bayesplot)
mcmc_combo(mcmc, pars = c("alpha", "beta", "sigma"))

traceplot(mcmc, inc_warmup = T)

#Extract log-likelihood produced from generated block
library(loo)
log_lik <- extract_log_lik(mcmc, parameter_name = "log_lik", merge_chains = TRUE)

waic(log_lik)
loo(log_lik)
