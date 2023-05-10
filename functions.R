#Built in functions
print(seq(1:10))
print(mean(1:10))
print(sum(1:10))

#user-defined functions

new.function <- function(a){
  print("----------User decinded functions-------------")
  for(i in 1:a){
    b <-i^2
    print(b)
  }
}

new.function(10)

new.function <- function(a,b,c){
  print("------multiple arguments -------------")
  result <- a*b+c
  print(result)
}

new.function(12,13,14)
new.function(a=1,b=2,c=3)

new.function = function(a=2, b = 3){
  result = a*b
  print(result)
}

new.function()
new.function(9,5)


new.function = function(a,b){
  print(a^2)
  print(a)
  print(b)
}

new.function(6)