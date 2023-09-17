#scatter plot

#plot(x,y,main, xlab, ylab, xlim, ylim, axes)


input <- mtcars[,c('wt','mpg')]
print(head(input))

png(file="Scatterplot.png")

plot(x=input$wt,y=input$mpg,
     xlab = "Weight",
     ylab = "Milage",
     xlim = c(2.5,5),
     ylim = c(15,30),
     main = "Weight vs Milage"
)

dev.off()


png(file="Scatterplot_matrices.png")
pairs(~wt+mpg+disp+cyl,data=mtcars, main = "Scatterplot Matrix")
dev.off()