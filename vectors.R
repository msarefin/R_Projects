print("abc");
print(12.5)
print(63L)
print(TRUE)
print(2+3i)
print(charToRaw('hello'))

#Creating sequence
v <- 5:13
print(v)
#If the last number is part of the sequence the it will be printed
v <- 6.6:12.6
print(v)
#If the last number is not within the sequence then it is rejected
v <- 3.8:11.4
print(v)

#Creating vector using the sequence incrementor
print(seq(5,9, by = 0.4))

s <- c('apple','red',5,TRUE)
print(s)


t <- c("sun","mon","tue","wed","thu","fri","sat")
u <- t[c(2,3,6)]
print(u)

v <- t[c(TRUE, FALSE,FALSE, FALSE, FALSE,TRUE, FALSE)]
print(v)

x <- t[c(-2,-5)]
print(x)

y <- t[c(0,0,0,0,0,0,1)]
print(y)

#vector manipulation

v1 <- c(3,8,4,5,0,11)
v2 <- c(4,11,0,8,1,2)

add.result <- v1+v2
print(add.result)

x <- v1+v2
print(x)

sub.result <- v1-v2
print(sub.result)

multi.result <- v1* v2
print(multi.result)

divi.result <- v1/v2
print(divi.result)


v1 <- c(3,8,4,5,0,11)
v2 <- c(4,11)

add.result <- v1+v2
sub.result <- v1-v2
multi.result <- v1*v2
divi.result <- v1/v2

print(add.result)
print(sub.result)
print(multi.result)
print(divi.result)

v <- c(3,8,4,5,0,11,-9,304)

sort.result <- sort(v)
print(sort.result)

revsort.result <- sort(v,decreasing = TRUE)
print(revsort.result)

v <- c("Red","Blue","Yellow","violet")
sort.result <- sort(v)
print(sort.result)

revsort.result <- sort(v, decreasing = TRUE)
print(revsort.result)
