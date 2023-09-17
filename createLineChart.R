#plot(v,type,col,xlab,ylab)

v <- c(7,12,28,3,41)
png(file="line_chart.png")
plot(v,type="o")
dev.off()



v <- c(7,12,28,3,41)
png(file ="line_chart_label_colored.jpg")

plot(v,type = "o",col = "red", xlab = "Month", ylab="rain fall", main = "Rain fall Chart")
dev.off()

#

v <- c(7,12,28,3,41)
t <- c(14,7,6,19,3)

png(file = "line_chart.jpg")

plot(v,type ="o", col="red",xlab = "Month",ylab = "Rian fall", main = "Rain fall chart")

lines(t,type="o", col="Blue")
dev.off()