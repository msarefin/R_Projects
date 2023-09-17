H <- c(7,12,28,3,41)
M <- c("Mar","Apr","May","Jun","Jul")

png(file="barchart_months_revenue.png")

barplot(H,names.arg=M, xlab="Month",ylab="Revenue",col="Blue",main="Revenue_chart",border="red")
dev.off()