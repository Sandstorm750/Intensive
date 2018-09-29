# 3. Заполнить массив числами фибоначчи до 100

fibo = []
a = 0
b = 1

while a < 100 && b < 100
  fibo << a
  fibo << b

  a = a + b
  b = a + b
  
end

puts fibo

