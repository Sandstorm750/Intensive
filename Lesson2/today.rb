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

months = [ 0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

if year % 400 == 0
  months[2] += 1
elsif year % 4 == 0 && year % 100 == 0
else year % 4 == 0
  months[2] += 1
end

puts "Пожалуйста введите число."
number = gets.to_i

if number > months[month] || number <= 0
  puts "Неверно указано число"
  exit
end

puts "Ваша дата: #{number}.#{month}.#{year}г. !!!"

box = months.take(month)

amount = box.sum

result = amount + number

puts "Ваша дата это #{result} день указанного года !!!"

