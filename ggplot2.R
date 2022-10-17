##ggplot2 
#install.packages("ggplot2")
library(ggplot2)
head(dtTips)


##++++++++++++++++++Pie chart
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



###++++++++++++++++++++++Bar Chart
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


###++++++++++++++++++++++++++Histogram

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


###++++++++++++++++++++Density plot

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




###+++++++++++++++++++W7:::17.10.22
###+++++++++++++++++++Box Plot

dtTip=read.csv('tips.csv')
library(ggplot2)
names(dtTip)
g0=ggplot(dtTip, aes(y='',x=tip))
g0+geom_boxplot(fill=4, 
                color=2, 
                alpha=0.9, 
                outlier.colour = 'blue', 
                linetype=2, 
                lwd=.6)+
  theme_classic()+
  theme(axis.title.x = element_text(), 
        plot.title = element_text(face = 'bold',
                                  hjust = .5, 
                                  color='darkgreen'))+
  ggtitle('Box Plot of the Tip')+
  xlab('Tip Amount')
ggsave('boxplotTip.png')



###+++++++++++++++++++Joint graphs
#Gender[F, M] and Smoker[Y, N] 

jtable=table(dtTip$sex, dtTip$smoker)
jtable=as.data.frame(jtable)
jtable

ggplot(jtable, aes(x=Var1, y=Freq, fill=Var2))+
  geom_col(position = position_dodge())+
  theme_classic()+
  theme(axis.title.x = element_text(),
        legend.title = element_text(color = 'blue'),
        plot.title = element_text(face = 'bold',
                                  hjust = .5, 
                                  color='darkgreen'))+
  ggtitle('Join bar graph of Gender and Smoking')+
  xlab('Gender')+
  theme(legend.position='bottom')+
  guides(fill=guide_legend('Smoking'))
ggsave('jointBarGenderSmoke.pdf')


####+++++++++++++++++++Joint density 
##Gender[F, M]  tip

g0=ggplot(dtTip, aes(x=tip, color=sex))
g0+geom_density()+
  theme_replace()+
  scale_color_manual(values = c('red', 'blue'))+
  xlim(-1,11)+
  theme(plot.title = element_text(face = 'bold', 
                                  hjust = .5), 
        axis.title.x = element_text(),
        axis.title.y = element_text(), 
        legend.title = element_text(color='blue'))+
  ggtitle('Joint distribution of Tip amount across Gender')+
  xlab('Tib Amount')+
  theme(legend.position = 'bottom')
ggsave('jointDensity.png')

#####+++++++++++++++++++Ridgeline plot
#smoker[y, n] tip
#install.packages('ggridges')
library(ggridges)

ggplot(dtTip, aes(x=tip, y=smoker, fill=smoker))+
  geom_density_ridges(color=4, 
                       lwd=.3)+
  theme_gray()+
  theme(plot.title = element_text(face = 'bold', 
                                  hjust = .5), 
        axis.title.x = element_text(),
        axis.title.y = element_text(), 
        legend.title = element_text(color='blue'))+
  ggtitle('Joint dist of Tip and Smoker')+
  xlab('Tip Amount')
ggsave('jointDistTipsSmoker.png')


######+++++++++++++++++++Joint box plot
#Gender[y,N] tip


ggplot(dtTip, aes(x=tip, y=sex, fill=sex))+
  geom_boxplot(color=2, 
               alpha=0.9, 
               outlier.colour = 'blue', 
               linetype=2, 
               lwd=.6)+
  stat_boxplot(geom = 'errorbar', 
               width=.5)+
  theme_gray()+
  theme(plot.title = element_text(face = 'bold', 
                                  hjust = .5), 
        axis.title.x = element_text(),
        axis.title.y = element_text(), 
        legend.title = element_text(color='blue'))+
  ggtitle('Joint dist of Tip and Gender')+
  xlab('Tip Amount')+
  ylab('Gender')+
  xlim(-1,11)
ggsave('jointboxplot.png')
######+++++++++++++++++++boxplot with points

boxplot(dtTip$tip, col = 'white', horizontal = T)
stripchart(dtTip$tip, 
           method = 'jitter', 
           pch=19, 
           col=4, 
           add = TRUE)

######+++++++++++++++++++Joint boxplot
##Gender[y,n] tip

boxplot(tip~sex,
        data = dtTip,
        col='white',
        horizontal = T)
stripchart(tip~sex,
           data = dtTip,
           method = 'jitter', 
           pch=19, 
           col=2:4,
           add = TRUE)
ggsave('jointboxplotwithpoints.pdf')
####+++++++++++++++++++Beeswarm graph

##install.packages('ggbeeswarm')

library(ggbeeswarm)
#smoker[y, n] tip

ggplot(dtTip, aes(x=smoker, y=tip, color=smoker))+
  geom_beeswarm(cex=1)








