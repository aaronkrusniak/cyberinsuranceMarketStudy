
#Temidayo
library(readr)
breachSorted <- read_csv("C:/Users/Dayo/Desktop/HospitalsThatHadBreaches09-18.csv")
View(breachSorted)

options(scipen = 999)

#From python script: for deductible of $100,000 and a revenue of $50,000,000

limits <- c(100000,250000,500000,1000000,2000000,2500000,3000000, 4000000, 5000000,7500000,10000000,15000000,20000000,25000000) 
price <- c(7011.0,11685.0,16359.0,23370.0,37438.74,43585.049999999996,49334.06999999999,59990.789999999986,69806.18999999999,91984.32,111848.82,147371.22,179201.15999999997,208577.25000000003)


#CDF

#According to Ponemon study
cost_of_breach_per_record <- 408

num_of_breached_records <- breachSorted$`Total Records`

year_of_breach <- breachSorted$`Year of Breach`

cost_of_breach <- num_of_breached_records * cost_of_breach_per_record
cost_of_breach
num_of_breached_records
max(cost_of_breach)
len <- length(cost_of_breach)
len

count_of_hospital_breach_covered <- c()
for (i in 1:length(limits)) {
  count_of_hospital_breach_covered[i] <- length(which(cost_of_breach <= limits[i]))  
  
}

count_of_hospital_breach_covered

percentage_of_hospital_breach_covered <- 100 * count_of_hospital_breach_covered/len 
percentage_of_hospital_breach_covered



plot(limits, percentage_of_hospital_breach_covered,pch=20, main = "CDF of Breaches Covered",xlab = "Insurance Limits", ylab = "% of Hospital Breaches Covered", type ="s")


df <- data.frame(price,limits,percentage_of_hospital_breach_covered)
df
df2 <- data.frame(price,limits)
df2


#Histogram
bins <- c(0,100,1000,10000,100000, 1000000)
breach_group <- cut(num_of_breached_records,bins)
breach_group
freq_table <- table(breach_group)

transform(table(breach_group))
freq_table2 <- transform(freq_table,Rel_Freq=prop.table(Freq),Cum_Freq=cumsum(Freq))
freq_table2

num_of_breached_records
hist(x = num_of_breached_records,breaks = c(0,100,1000,10000,100000, 1000000))
h <- hist(log10(num_of_breached_records), breaks=6)
h$counts <- h$counts / sum(h$counts)
plot(h, freq=TRUE,xlab = "Number of Breached Record", main="Relative Frequency of Total Breached Records", ylim = c(0.0,0.6),xaxt = "n" )
axis(1, at = pretty(h$breaks), labels = 10^pretty(h$breaks))
