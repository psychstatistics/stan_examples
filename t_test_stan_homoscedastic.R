require(ggplot2)
require(rstan)
data(sleep)

sleep

p <- ggplot(data = sleep, aes(x = group, y = extra))
p + geom_boxplot(aes(fill = factor(group)))


t.test(extra ~ group, data = sleep)


data_t_test1 <- list(N1 = length(sleep$extra[sleep$group==1]),
                     N2 = length(sleep$extra[sleep$group==2]),
                     extra1 = sleep$extra[sleep$group==1],
                     extra2 = sleep$extra[sleep$group==2])

fit_t_test1 <- stan(file = "t_test_stan_homoscedastic.stan", data = data_t_test1, iter=10000, chains=2)
print(fit_t_test1)

test <- as.data.frame(fit_t_test1)
head(test)
plot(density(test$extra1_new))