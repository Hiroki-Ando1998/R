data {
  int<lower=0> N;      // サンプル数
  vector[N] x;         // 説明変数
  vector[N] y;         // 目的変数
}

parameters {
  real alpha;          // 切片
  real beta;           // 回帰係数
  real<lower=0> sigma; // 誤差の標準偏差
}

model {
  // Priors
  alpha ~ normal(0, 10);
  beta ~ normal(0, 10);
  sigma ~ normal(0, 10);

  // Likelihood
  y ~ normal(alpha + beta * x, sigma);
}

generated quantities {
vector[N] y_rep;  // 事後予測値
  
  for (n in 1:N) {
    y_rep[n] = normal_rng(alpha + beta * x[n], sigma);
  }
}
