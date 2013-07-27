data {
  int<lower=1> N1; // number of subjects in group1
  int<lower=1> N2; // number of subjects in group2
  real extra1[N1]; // outcome for group1
  real extra2[N2]; // outcome for group2
}
parameters {
  real mu1;
  real mu2;
  real<lower=0> sigma1;
  real<lower=0> sigma2;
}
model {
  extra1 ~ normal(mu1, sigma1);
  extra2 ~ normal(mu2, sigma2);
  mu1 ~ normal(0,5);
  mu2 ~ normal(0,5);
  sigma1 ~ cauchy(0,5);
  sigma2 ~ cauchy(0,5);
}
generated quantities {
  real mudiff;
  real sigmadiff;
  real extra1_new;
  real extra2_new;
  mudiff <- mu1 - mu2;
  sigmadiff <- sigma1 - sigma2;
  extra1_new <- normal_rng(mu1, sigma1);
  extra2_new <- normal_rng(mu2, sigma2);
}