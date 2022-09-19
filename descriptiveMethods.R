####+++++++++++++++++++ITC 255/Fall 2022+++++#
#Descriptive methods
  #Univar case 
     #FDT 
        #Categorical variables

##Upload the data 
#dataset tips

dfTips=read.csv(url('https://raw.githubusercontent.com/mwaskom/seaborn-data/master/tips.csv'))
head(dfTips)

#FDT smoker
absFreq=table(dfTips$smoker)
absFreq
relFreq=round(prop.table(absFreq), 2)
relFreq
cumFreq=cumsum(relFreq)
cumFreq

fdtSmoker=cbind(absFreq, relFreq, cumFreq)
fdtSmoker

names(dfTips)
##Create a function that returns the FDT of a cat var
fdtCat=function(x){
  absFreq=table(x)
  relFreq=prop.table(absFreq)
  cumFreq=cumsum(relFreq)
  fdtx=cbind(absFreq, relFreq, cumFreq)
  return(fdtx)
}

#test
fdtCat(dfTips$day)
#export using write.csv(....)

#Descriptive methods
  #Univar case 
    #FDT 
      #Numerical variables

#1. Transform the variable into a categorical var
#based a definition/we specify them 
names(dfTips)

#tips
summary(dfTips$tip)

#define catgories: small whtn tip<3 meduim when tip is 3>= but less than 7, large otherwise

#selection + Loop
catTips=c()

for (k in 1:length(dfTips$tip)) {
  if(dfTips$tip[k]<3){
    catTips[k]="smallTip"
  } else if (dfTips$tip[k] >=3 & dfTips$tip[k]<7) {
    catTips[k]="meduimTip"
  } else {
    catTips[k]="largetip"
  }
}


tipAmount=cbind(dfTips$tip, catTips)
View(tipAmount)


#catTips is a cat var
#CALL the function fdtCat
fdtCat(catTips)







