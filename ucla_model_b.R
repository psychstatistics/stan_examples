library(foreign)
library(rstan)

data_full <- read.dta("http://www.ats.ucla.edu/stat/stata/examples/alda/data/alcohol1_pp.dta")

alcuse <- data_full$alcuse
N <- length(alcuse)
id <- data_full$id
J <- max(id)
parms <- c("b", "sig_e", "sig_u", "Sigma", "Omega")
mu_prior <- c(0,0)
age_14 <- data_full$age_14

randslope_data <- list(alcuse=alcuse, N=N, id=id, J=J, mu_prior = mu_prior, age_14=age_14)
fit0 <- stan(file = "ucla_model_b.stan", pars = parms, data = randslope_data, iter=10000, chains=3)
print(fit0)


