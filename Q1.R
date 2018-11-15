br <- read.csv("http://secon.utulsa.edu/course/data/pharmterms4.csv", header=T)

summary(br)
head(br)

google <- (br$redirects[br$searchEngine == "google"])
summary(google)
 
bing <- (br$redirects[br$searchEngine == "bing"])
summary(bing)
 
length(google)
prop.test(length(google), 85221, p = 0.2537 ,correct = TRUE)
 
length(bing)
prop.test(length(bing), 90574, p = 0.1091 ,correct = TRUE)
 
boxplot(br$resultPosition~br$redirects, method='stack', pch = 19, xlabel='redirect or not', ylabel='position')
bp <- boxplot(br$resultPosition~br$redirects, method='stack', pch = 19, xlabel='redirect or not', ylabel='position')
bp
 
wilcox.test(br$resultPosition~br$redirects, data=br, conf.int=T, na.rm=T)
 
TOH<-table(br$tld, br$redirects)
TOH
TOH.srt<-table(br$tld, br$redirects)
mosaicplot(TOH.srt, col=rainbow(ncol(TOH.srt)))
 
TOH.cs <- chisq.test(TOH.srt)
TOH.cs
mosaicplot(TOH.srt,shade=T)
 
 