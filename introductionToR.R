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
#sequencing: write the order of the actions 
             #follow the order

#Selection: select a specific action based on a condition

x=0
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



