=begin
5. Заданы три числа, которые обозначают число, месяц, год (запрашиваем у пользователя).
Найти порядковый номер даты, начиная отсчет с начала года. Учесть, что год может быть високосным. 
=end

puts "Пожалуйста введите год."
year = gets.to_i

puts "Пожалуйста введите номер месяца."
month = gets.to_i

if month > 12 || month < 1
    puts "Неверно указан месяц."
    exit
end

puts "Пожалуйста введите число."
number = gets.to_i

months = {1 => 31, 2 => 28, 3 => 31, 4 => 30, 5 => 31, 6 => 30,
  7 => 31, 8 => 31, 9 => 30, 10 => 31, 11 => 30, 12 => 31}

if
  year % 4 == 0
  months[2] = 29
  puts "Год високосный!"
 else
    puts "Год не високосный!"
end

#p months

months.each do |key, value|
  key = month
  if number > value || number < 1
    puts "Неверно указано число."
    exit
  end
end

puts "Ваша дата: #{number}.#{month}.#{year}г. !!!"

box = []
months.each do|key, value|
  if key < month
    box << value
  end
end
#p box

amount = 0
index = 0

for days in box
  amount = amount + days
  index += 1
end

#puts amount

result = amount + number

puts "Ваша дата это #{result} день указанного года !!!"

