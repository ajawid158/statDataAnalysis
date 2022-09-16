####+++++++++++++++++++++++++++++Fall 2022/ITC 255+++++++####

#Introduction to R programming
#1. Data types in R
x=12
class(x)
y=12.6
class(y)

t='this is an Intro to R'
class(t)

l=4>10
l
class(l)

##variables
#names: valid+informative
myClass='itc255'
myMajor='BBA'
myAverageGPA=3.2

##data structures in R 
ageStudents=c(23, 24, 26, 21)
ageStudents

class(ageStudents)
typeof(ageStudents)

genderStudents=c('F','M','M','F')
genderStudents
length(genderStudents)


length(genderStudents) == length(ageStudents)
str(ageStudents)




#dataframe
dfStudents=data.frame(Gender=c('F','M','M','F'), 
                      Age=c(23,24,25,21), 
                      ClassLevel=c('FRM', 'SoPH','JN','SN'))

dfStudents
dim(dfStudents)

##4 observations, and 3 variables
dfStudents[2,3]
str(dfStudents)
length(dfStudents)

###Uploading the dataset
##From the web
dfTips=read.csv(url('https://raw.githubusercontent.com/mwaskom/seaborn-data/master/tips.csv'))
head(dfTips)
dim(dfTips)
tipsAmount=dfTips$tip

##from a local drive
write.csv(dfTips, file = 'tips.csv')
dfTips=read.csv('tips.csv')
tail(dfTips)

#Control structures in R
#1 sequencing: write the order of the actions 
             #follow the order

#2 Selection: select a specific action based on a condition

x=-12
if (x>0){
  print('Positive')}



if (x>0) {
  print('positive')
} else {
  print('non-positive')
}



if (x>0) {
  print('positive')
} else if (x==0){
      print('zero')
    } else {
      print('negative')
    }

##number of real solutions in QE
#ax^2+bx+c=0
#delta=b^2-4ac

delta=-1


if (delta>0){
  print('2 real solutions')
} else if (delta==0){
  print('1 real solution')
} else {
  print('no real solution')
}



#3 Loop
# is use to perform an action repeated/a question is asked until we cover all elemets


x=c(-1, 2, 3, -12)

for (i in 1:4) {
  x[i]=x[i]+12
}
x

y=c()
for (i in 1:4) {
  y[i]=x[i]+12
}
y

##Writing your own functions

#sum
mySum=function(x){
  sm=0
  for (i in 1: length(x)){
    sm=sm+x[i]
  }
  return(sm)
}


x=c(1,2,4)
mySum(x)


#mean
myMean=function(x){
  sm=0
  n=length(x)
  for (i in 1:length(x)) {
    sm=sm+x[i]
  }
  return(cat('the mean is:', sm/n))
}

myMean(x)

#max
myMax=function(x){
  mx=x[1]
  for (i in 2:length(x)){
    if(x[i]>mx){
      mx=x[i]
    } else{
      mx=mx
    }
  }
  return(mx)
}
myMax(x)

y=c(-2, 1, 3, 0)
myMax(y)
