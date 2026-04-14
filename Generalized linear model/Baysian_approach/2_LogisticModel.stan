data {
  int<lower=0> n_cd;
  vector[n_d] ww;
  int<lower=0> n_count[n_cd];
  int row_cd[n_cd];
}

parameters {
  real<lower=-4, upper=4> c1_raw;
  real<lower=-4, upper=4> c2_raw;
}

transformed parameters{
    real c1;
     c1 = -22 + 5*c1_raw;
  
    real c2;
    c2 = exp(1+c2_raw);
}

model {
  // Priors
  c1_raw ~ normal(0, 1);
  c2_raw ~ normal(0, 1);
  
  // Compute probabilities using the logistic function and likelihood for Bernoulli observations
    vector[n_cd] p;
    for (k in 1:n_cd) {
      p[k] = inv_logit(c1 + c2 * ww[row_cd[k]]);
      nd[k] ~ binomial(n_count[k], p[k]); 
    } 
}
