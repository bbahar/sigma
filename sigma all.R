require('ggplot2')

datasigma <- read.csv("C:/Users/bbahar/Desktop/ssigma/sigma.csv")

c <- data.frame(x=c(3,0), y=c(0,6))

ggplot(datasigma, aes(x=Per_CV, y=Per_bias)) + geom_point() + 
  xlab('Observed Imprecision (%)') + ylab('Observed Inaccuracy (%)') +
  ggtitle('All Data') + 
  xlim(0,4) +
  geom_line(data=c, aes(x=c(3,0), y=c(0,6)), color = 'RED') + 
  geom_line(data=c, aes(x=c(2,0), y=c(0,6)), color = 'ORANGE') +
  geom_line(data=c, aes(x=c(1.5,0), y=c(0,6)), color = 'YELLOW') +
  geom_line(data=c, aes(x=c(1.2,0), y=c(0,6)), color = 'BLUE') +
  geom_line(data=c, aes(x=c(1,0), y=c(0,6)), color = 'GREEN') +
  facet_wrap(~Run)

datasigma_100 <- datasigma[datasigma$No_labs>100,]

#above 100 peers

ggplot(datasigma_100, aes(x=Per_CV, y=Per_bias)) + geom_point(size=4, aes(shape=Method)) +
  scale_shape_manual(values=LETTERS[1:15]) +
  xlab('Observed Imprecision (%)') + ylab('Observed Inaccuracy (%)') +
  ggtitle('All Survey Results (Above 100 Peers)') + 
  xlim(0,4) +
  geom_line(data=c, aes(x=c(3,0), y=c(0,6)), color = 'RED') + 
  geom_line(data=c, aes(x=c(2,0), y=c(0,6)), color = 'ORANGE') +
  geom_line(data=c, aes(x=c(1.5,0), y=c(0,6)), color = 'YELLOW') +
  geom_line(data=c, aes(x=c(1.2,0), y=c(0,6)), color = 'BLUE') +
  geom_line(data=c, aes(x=c(1,0), y=c(0,6)), color = 'GREEN') +
  facet_wrap(~Run) +
  theme(legend.position=c(.85, 0.25))

#all peers

ggplot(datasigma, aes(x=Per_CV, y=Per_bias)) + geom_point(size=4, aes(shape=Method)) +
  scale_shape_manual(values=c(65:90,97:110)) +
  xlab('Observed Imprecision (%)') + ylab('Observed Inaccuracy (%)') +
  ggtitle('2015 GH5-A Survey Results') + 
  xlim(0,4) +
  geom_line(data=c, aes(x=c(3,0), y=c(0,6)), color = 'RED') + 
  geom_line(data=c, aes(x=c(2,0), y=c(0,6)), color = 'ORANGE') +
  geom_line(data=c, aes(x=c(1.5,0), y=c(0,6)), color = 'YELLOW') +
  geom_line(data=c, aes(x=c(1.2,0), y=c(0,6)), color = 'BLUE') +
  geom_line(data=c, aes(x=c(1,0), y=c(0,6)), color = 'GREEN') +
  facet_wrap(~Run)