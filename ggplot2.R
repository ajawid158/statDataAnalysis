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

