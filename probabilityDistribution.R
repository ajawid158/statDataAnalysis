###+++++++++++++++++++++++++++++++###
##Dec 2/Week 14 Fall 2022
####Simulating probability distribution

#1 Binomial distribution

#Example: toss a coin 20 times and count the # of heads as success.
x=seq(0,20, by=1)
x  #possible values of X

#copmute the probablity of each value
#Pr(X=1) 1 head in 4 tries
dbinom(4, 4, prob = 0.5)

#we can calculate the prob of all x
#Pr(X=x)
y=dbinom(x, 20, prob = 0.5)
head(y)

dt=as.data.frame(cbind(x,y))
#install.packages('ggplot2')
library(ggplot2)
g1=ggplot(data = dt, aes(x=x, y=y))+
  geom_line(linetype='dashed')+
  geom_point()
g1

##Commulative prob
#Pr(X<=k) Pr(X<=4)
pbinom(10, 20, prob = 0.3)   #Pr(X<=5)
#plot the ecdf to for all cummulative prob
cdf=pbinom(x, 20, prob = 0.3)
dt1=as.data.frame(cbind(x, cdf))

g2=ggplot(data = dt1, aes(x=x, y=cdf))+
  geom_line(linetype='dashed', color='blue')+
  geom_point(color='red')
g2

#Random numbers generators with binomial distribution
rbinom(1, 2, prob = 0.5)
rbinom(n, size, p)
help("rbinom")

#n=the number of experiments
#sample size= the number of trials in each experiment 
#p=prob of success

#toss a coin 100 times and counting the # of heads 49 heads 
#day 2 51 heads
#day 3 50 heads
#.
#. day 7  53 heads
#repeat this experiment 7 days> hence we have 700 tries
rbinom(n=7, size=100, prob=0.4)

#Example: The gender of 10 customers are recorded everyday, p=0.6. 
#the experiment is done 20 days.
d=rbinom(20, 10, 0.6)
hist(d)

#Simulate this 
d=rbinom(50, 100, 0.6)
d
hist(d)

#Summary 
dbinom(), pbinom(), rbinom()
###++++++++++++++++++++++++++++++###
######2. Uniform distribution
x=seq(0, 20, by=1)

#probability of each value
dunif(1, 0, 20)
y=dunif(x, 0, 20)
plot(x,y)


#cumulative distribution 
#Pr(X<=3)

y1=punif(x, 0, 20)
plot(x,y1)

##generate uniformillay distributed observations
r1=runif(10000, 0,20)
hist(r1)
plot(density(r1))



###+++++++++++++++++++++++++++++++###
###3. Poisson distribution
help("dpois")

#Example: on average 10 calls are received per hour at a call center. 
#lambda=10
#Pr(X=8)
dpois(8, 10)

x=seq(0,30, by=1)
y2=dpois(x, 3)

dt2=as.data.frame(cbind(x, y2))
g3=ggplot(data = dt2, aes(x=x, y=y2))+
  geom_line(linetype='dashed', color='blue')+
  geom_point(color='red')
g3


#cumulative prob
#Pr(X<=8)
ppois(8, 10)
cdfp=ppois(x, 10, lower.tail = TRUE)
dt3=as.data.frame(cbind(x, cdfp))
dt2=as.data.frame(cbind(x, y2))
g4=ggplot(data = dt3, aes(x=x, y=cdfp))+
  geom_line(linetype='dashed', color='blue')+
  geom_point(color='red')
g4


#Generatin Poisson distribed RN:
yp=rpois(1000, 2)
hist(yp)

#9 means there 9 occurances at a give interval


###+++++++++++++++++++++++++++++++###
##4. Geometric distriution 
#Example: the chance that a student gets A is 0.18. A gourp of students 
#are taking a test at random order. Compute the chance the first one 
#gets A: Pr(X=1)
dgeom(1, 0.18)

x=seq(1,20, by=1)
y4=dgeom(x, 0.18)

dt4=as.data.frame(cbind(x, y4))
g5=ggplot(data = dt4, aes(x=x, y=y4))+
  geom_line(linetype='dashed', color='blue')+
  geom_point(color='red')
g5


#cumulative probability
cdfg=pgeom(x, 0.18, lower.tail = TRUE)
dt4=as.data.frame(cbind(x, cdfg))

g6=ggplot(data = dt4, aes(x=x, y=cdfg))+
  geom_line(linetype='dashed', color='blue')+
  geom_point(color='red')
g6

#generate the Geometrically distributed RN
yg=rgeom(1000, 0.2)
head(yg)

##5 means there 5 failure before a success occures
#1 means there is 1 failure before a sucess is observed

df=dgeom(yg, .2)
dt5=as.data.frame(cbind(yg, df))
g7=ggplot(data = dt5, aes(x=yg, y=df))+
  geom_line(linetype='dashed', color='blue')+
  geom_point(color='red')
g7


###+++++++++++++++++++++++++++++++###
##6 Normal distribution
#generate normally distributed population
#Suppose students GPA has a normal dist with m=2.9 and sd=1.2

normdata=rnorm(10000, 2.9, 0.9)
plot(density(normdata))

#pnorm cumulative normal distribution 
#Pr(X<=3)
pnorm(3, 2.9, 0.9)

x=seq(0,4, by=0.01)
cf=pnorm(x, 2.9, 0.9)
dt6=as.data.frame(cbind(x, cf))

g7=ggplot(data = dt6, aes(x=x, y=cf))+
  geom_line(color='blue')
g7

