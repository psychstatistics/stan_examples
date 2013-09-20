data {
  int<lower=1> N;
  real alcuse[N];   //outcome
  int<lower=1> J;   //number of subjects
  int<lower=1, upper=J> id[N];  //subject id
}
parameters {
  real b;      // intercept and slope
  real u[J];   // random intercept and slope
  real<lower = 0> sig_e;  // residual variance 
  real<lower=0> sig_u;   // cluster variances for intercept and slope
}
model {
  real mu[N];
  for (i in 1:N) {
      mu[i] <- b + u[id[i]];
    }
  alcuse ~ normal(mu,sig_e);    // likelhood
  b ~ normal(0,5);
  u ~ normal(0,sig_u);
  sig_u ~ cauchy(0,5);
  sig_e ~ cauchy(0,5);
}