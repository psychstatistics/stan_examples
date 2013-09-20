library(foreign)
library(rstan)

data_full <- read.dta("http://www.ats.ucla.edu/stat/stata/examples/alda/data/alcohol1_pp.dta")

alcuse <- data_full$alcuse
N <- length(alcuse)
id <- data_full$id
J <- max(id)
parms <- c("b", "sig_e", "sig_u")

randint_data <- list(alcuse=alcuse, N=N, id=id, J=J)
fit0 <- stan(file = "ucla_model_a.stan", pars = parms, data = randint_data, iter=10000, chains=3)
print(fit0)