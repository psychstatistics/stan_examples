  data {
    int<lower=1> N;
    real alcuse[N];   //outcome
    real age_14[N];   //predictor
    int<lower=1> J;   //number of subjects
    int<lower=1, upper=J> id[N];  //subject id
    vector[2] mu_prior; //vector of zeros passed in from R
  }
  parameters {
    vector[2] b;      // intercept and slope
    vector[2] u[J];   // random intercept and slope
    real<lower = 0> sig_e;  // residual variance 
    vector<lower=0>[2] sig_u;   // cluster variances for intercept and slope
    corr_matrix[2] Omega;     // correlation matrix for random intercepts and slopes
  }
  transformed parameters {
    cov_matrix[2] Sigma;  // constructing the variance/cov matrix for random effects
    for (r in 1:2) {
      for (c in 1:2) {
        Sigma[r,c] <- sig_u[r] * sig_u[c] * Omega[r,c];
      }
    }
  }
  model {
    real mu[N];   // mu for likelihood
    for (j in 1:J) u[j] ~ multi_normal(mu_prior, Sigma);  // loop for random effects
    for (i in 1:N) {
      mu[i] <- b[1] + b[2]*age_14[i] + u[id[i], 1] + u[id[i], 2]*age_14[i];
    }
    alcuse ~ normal(mu,sig_e);    // likelhood
    b ~ normal(0,5);
    sig_e ~ cauchy(0,5);
    sig_u ~ cauchy(0,5);
    Omega ~ lkj_corr(2.0);
  }

