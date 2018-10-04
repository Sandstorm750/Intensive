# 2. Заполнить массив числами от 10 до 100 с шагом 5

numbers = []
i = 10

loop do
  numbers << i
  i += 5
  break if i > 100
end

p numbers

