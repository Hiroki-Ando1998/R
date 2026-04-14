#関数	  対象	出力
#apply	行列	ベクトル/配列
#lapply	リスト	リスト
#sapply	リスト	簡略化結果
#vapply	リスト	型固定出力
#tapply	ベクトル + グループ	集約結果


＃Basic grammer: apply(X, MARGIN, FUN)

mat <- matrix(1:12, nrow = 3)
apply(mat, 2, mean) #column
apply(mat, 1, sum) # row

#---------------------------------------------------------------------------------(2)
post <- as.data.frame(mcmc_7)
alpha_post <- post[, grep("^alpha\\[", colnames(post))]

alpha_summary <- data.frame(
  alpha_id = 1:ncol(alpha_post),
  median = apply(alpha_post, 2, median),
  lower  = apply(alpha_post, 2, quantile, probs = 0.025),
  upper  = apply(alpha_post, 2, quantile, probs = 0.975)
)

alpha_summary <- alpha_summary %>%
  dplyr::arrange(median) %>%
  dplyr::mutate(alpha_id = dplyr::row_number())


#----------------------------------------------------------------------------------(3)
mcmc_sample <- rstan::extract(mcmc_7)
state_name <- "mu_rep" 
result_mu_rep <- data.frame(t(apply( #t:転置
  X = mcmc_sample[[state_name]],
  MARGIN = 2,
  FUN = quantile,
  probs = c(0.025, 0.5, 0.975)
)))

colnames(result_mu_rep) <- c("mu_low_7", "mu_med_7", "mu_upr_7")
