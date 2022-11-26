
##RV probability distribution

valX=c(0,1,2,3,4,">4")
probs=c(.04, .1, .26, .31,.24, .05)

barplot(probs, 
        names.arg = valX, 
        col='blue')
abline(h=0)


#Continues RV

dt=read.csv('timeToOffice.csv')
head(dt)

#plot the p density function
plot(density(dt$T), 
     main = 'p density function of T', 
     ylim=c(0, 0.3))
abline(v=15)
abline(v=17)

#Calulate probs
#Pr(T is in [15, 17])~59%
ecdf(dt$T)(17)-ecdf(dt$T)(15)

#Pr(T is less than 14)

ecdf(dt$T)(14)

#Pr(T is more than 16)

1-ecdf(dt$T)(16)
