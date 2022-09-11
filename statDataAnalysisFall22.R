####+++++++++++++++Fall 2022/ITC 255++++++++++++#
#install R/Rstudio
#connect to git/github


##Introduction to R
#1. Data types
x=12L
class(x)
y=-12.2
class(y)
t='R progmming'
class(t)
p=2<3
p
class(p)
typeof(t)
#2. Data structures in R 
#vector
x=c(1,2,-1)
typeof(x)
p=c(TRUE, FALSE)
typeof(p)
a=c('F','M')
typeof(a)
class(a)
length(a)
str(a)
str(x)

x[1]
a[2]

#List
l=list('F', 'M', c(22,24), c('yes', 'no', 12))
l
typeof(l)
class(l)
length(l)
str(l)

#Matrix..2D

m=matrix(c(1,2,3,4), nrow = 2, ncol = 2, byrow = T)
m

typeof(m)
class(m)
str(m)
length(m)
dim(m)
m[1,]
m[,1]
m[2,2]

#dataframe 2-d

df=data.frame(gender=c('f', 'm'),
              age=c(23, 34),
              mstatus=c('married', 'married'), 
              height=c(161.2, 188.8))
df

typeof(df)
class(df)
length(df)  #number of columns
str(df)

df[1,]
df[,2]

###3. 

