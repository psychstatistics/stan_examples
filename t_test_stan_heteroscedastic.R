require(rstan)
data(sleep)

sleep

data_t_test2 <- list(N1 = length(sleep$extra[sleep$group==1]),
                     N2 = length(sleep$extra[sleep$group==2]),
                     extra1 = sleep$extra[sleep$group==1],
                     extra2 = sleep$extra[sleep$group==2])

fit_t_test2 <- stan(file = "t_test_stan_heteroscedastic.stan", data = data_t_test2, iter=10000, chains=3)
print(fit_t_test2)

