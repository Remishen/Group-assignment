phil = as.data.frame(X2020_12_0822_12_15_linear_phil)
colnames(phil) = c("time", "ax", "ay", "az", "atotal")
jiahao = as.data.frame(Linear_Acceleration)
fangyu = as.data.frame(Linear_Fangyu)
chloe = as.data.frame(linear_chloe_FINAl)

jiahao = Linear_Acceleration[,-c(1,2,3,4)]
fangyu = Linear_Fangyu[,-c(1,2,3,4)]
chloe = linear_chloe_FINAl[,-c(1,2,3,4)]
phil = X2020_12_0822_12_15_linear_phil[,-c(1,2,3,4)]


jiahao$max = max(jiahao$atotal)
jiahao$mean = mean(jiahao$atotal)
jiahao$median = median(jiahao$atotal)
fangyu$max = max(fangyu$atotal)
fangyu$mean = mean(fangyu$atotal)
fangyu$median = median(fangyu$atotal)
chloe$max = max(chloe$atotal)
chloe$mean = mean(chloe$atotal)
chloe$median = median(chloe$atotal)
phil$max = max(phil$atotal)
phil$mean = mean(phil$atotal)
phil$median = median(phil$atotal)


jiahao = jiahao[1:260,]
fangyu = fangyu[1:260,]
chloe = chloe[1:260,]
phil = phil[1:260,]

data = cbind(jiahao,fangyu,chloe,phil)
colnames(data) = c("jiahao","fangyu","chloe","phil")

fit = kmeans(data$max, 2)
data2 = data.frame(data, fit$cluster)
name = c("jiahao","fangyu","chloe","phil")
data2 = cbind(data2, name)



library(ggplot2)
library(GGally)
ggpairs(data, 1:3, progress = FALSE)
ggplot(data2, aes(name, max, colour = fit.cluster)) + geom_line() + xlab("X") + ylab("Y")
