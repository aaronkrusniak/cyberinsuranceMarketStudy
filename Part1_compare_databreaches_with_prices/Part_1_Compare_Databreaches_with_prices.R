db <- read.csv("~/Desktop/prcAllData.csv", header=T)
summary(db)

breach <- db$Year.of.Breach
breachtable <- data.frame(breach)

breachplot <- table(breachtable)
plot(breachplot, type = "l", main = "Number of Breaches per Year in the US", xlab = "Year", ylab = "Number of Breaches")


db2 <- read.csv("~/Sorted_Insurancy_Prices.csv", header = T)
db2$X <- NULL

class(db2$sortcp.Submission.Date)
db2$sortcp.Submission.Date <- strptime(db2$sortcp.Submission.Date, format="%d/%m/%Y")
class(db2$sortcp.Submission.Date)

plot(db2, type = "l", main="Cyberinsurance Prices in Carlifornia", xlab="Year ([00]Year)", ylab="Price")

tr2 <- read.csv("~/Breaches_Year_Sorted1.csv", header = T, stringsAsFactors=FALSE)
plot(tr2)
