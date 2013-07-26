data {
  int<lower=1> N1; // number of subjects in group1
  int<lower=1> N2; // number of subjects in group2
  real extra1[N1]; // outcome for group1
  real extra2[N2]; // outcome for group2
}
parameters {
  real mu1;
  real mu2;
  real<lower=0> sigma;
}
model {
  extra1 ~ normal(mu1, sigma);
  extra2 ~ normal(mu2, sigma);
  mu1 ~ normal(0,5);
  mu2 ~ normal(0,5);
  sigma ~ cauchy(0,5);
}
generated quantities {
  real mudiff;
  real extra1_new;
  real extra2_new;
  mudiff <- mu1 - mu2;
  extra1_new <- normal_rng(mu1, sigma);
  extra2_new <- normal_rng(mu2, sigma);
}