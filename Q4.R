install.packages("survival")

br <- read.csv("http://secon.utulsa.edu/course/data/ptsurv-anon2.csv", header=T)
library(survival)

summary(br)
head(br)

S.all <- Surv(time=br$lt, event=br$censor, type='right')
surv.all <- survfit(S.all~br$pt1st)

plot(surv.all, xlab='t days before recompromise', ylab='S(t): probability website has not been recompromised within t days', ylim=c(0.7,1), col= c('blue', 'red'), main='Survival function for phishing websites', lwd=1.5,)
legend("topright", legend=c("in phistank first", "not in phistank first"), col=c("red","blue"), lty=1)

survdiff(S.all~br$pt1st)