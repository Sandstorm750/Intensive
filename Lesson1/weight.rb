=begin
Идеальный вес.
Программа запрашивает у пользователя имя и рост и выводит идеальный вес по формуле <рост> - 110,
после чего выводит результат пользователю на экран с обращением по имени.
Если идеальный вес получается отрицательным, то выводится строка "Ваш вес уже оптимальный"
=end

puts "Пожалуйста, напишите Ваше имя английским шрифтом."
your_name = gets.chomp

puts "Теперь назовите свой рост в сантиметрах."
your_height = gets.to_i

ideal_weight = your_height - 110

if ideal_weight <= 0
  print " #{your_name}, Ваш вес уже оптимален!"
else
  print " #{your_name}, Ваш идеальный вес составляет #{ideal_weight} кг!!!"
end


