##ggplot2 
#install.packages("ggplot2")
library(ggplot2)
head(dtTips)


##Pie chart
#Gender

fdtGender=table(dtTips$sex)
fdtGender=as.data.frame(fdtGender)
fdtGender
colnames(fdtGender)=c("Gender","Count")


g0=ggplot(fdtGender, aes(x="", y=Count, fill=Gender))
g1=g0+geom_col()+
  coord_polar(theta = "y")+
  theme_void()+
  theme(plot.title = element_text(colour = "blue",
                                  size = 14, 
                                  face = "bold", 
                                  hjust = .5))+
  ggtitle('Gender Distribution of Customers')+
  geom_text(aes(label=Count), 
            position = position_stack(vjust = .5))+
  scale_fill_manual(values = c('#EC754A', '#BE2A3E'))+
  theme(legend.position = 'bottom')
ggsave('genderDist.png')
  
g1



###Bar Chart
dtTips
library(ggplot2)
tGender=table(dtTips$sex)
tGender=as.data.frame(tGender)
colnames(tGender)=c('Gender', 'Count')

g0=ggplot(tGender, aes(x=Gender, y=Count, fill=Gender))
g0+geom_bar(stat='identity')+
  theme_classic()+
  theme(legend.position = '')+
  theme(axis.title.x = element_text(),
        axis.title.y = element_text(),
        plot.title = element_text(face = 'bold', hjust=.5))+
  ggtitle('Customers Gender Distribution')+
  geom_text(aes(label=Count), vjust=2)+
  scale_fill_manual(values=c('#FF9933', '#0000CC'))
ggsave('genderBar.pdf')

###Histogram
g0=ggplot(dtTips, aes(x=tip))
g0+geom_histogram(bins = 10, fill='#99FFFF', colour=4)+
  theme_classic()+
  theme(plot.title = element_text(face = 'bold',
                                  hjust = .5), 
        axis.title.x = element_text(), 
        axis.title.y = element_text())+
  ggtitle('Tip Distribution')+
  xlab('Tip Amount')+
  ylab('Frequency')+
  geom_vline(xintercept = 3,
             linetype='dashed',
             color='red', 
             size=1)
ggsave('tipDistHist.png')

###Density plot
g0=ggplot(dtTips, aes(x=tip))
g0+geom_density(color='red', size=.6)+
  theme_classic()+
  xlim(0,12)+
  theme(plot.title = element_text(face = 'bold',
                                  hjust = .5), 
        axis.title = element_text(), 
        axis.title.y = element_text())+
  ggtitle('Tip Distribution')+
  xlab('Tip Amount')+
  ylab('Density')+
  geom_vline(xintercept = 3,
             linetype='dashed',
             color='blue', 
             size=1)
ggsave('tipDistHist.png')
