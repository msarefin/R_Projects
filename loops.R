v <- c("Hello","loop")
cnt <- 2

print("-----------repeat-----------")
repeat{
  print(v)
  cnt <- cnt+1
  
  if(cnt >5){
    break
  }
}
print("-----------while-----------")
cnt <-2
while(cnt<7){
  print(v)
  cnt = cnt +1
}

print("-----------for-----------")

v<- LETTERS[1:4]
for(i in v){
  print(i)
}

v<- LETTERS[1:4]
for(i in v){
  print(i)
}


print("-----------next-----------")


v <- LETTERS[1:6]
for(i in v){
  if(i=="D"){
    next
  }
  print(i)
}