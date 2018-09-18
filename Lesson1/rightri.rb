=begin
Прямоугольный треугольник.
Программа запрашивает у пользователя 3 стороны треугольника и определяет, является ли треугольник
прямоугольным, используя теорему Пифагора (www-formula.ru) и выводит результат на экран.
Также, если треугольник является при этом равнобедренным (т.е. у него равны любые 2 стороны),
то дополнительно выводится информация о том, что треугольник еще и равнобедренный.
Подсказка: чтобы воспользоваться теоремой Пифагора, нужно сначала найти самую длинную
сторону (гипотенуза) и сравнить ее значение в квадрате с суммой квадратов двух остальных сторон.
Если все 3 стороны равны, то треугольник равнобедренный и равносторонний, но не прямоугольный.
=end
puts "Определяем какой у нас треугольник."
puts
puts "Введите длину первой стороны."
side1 = gets.to_f

puts "Введите длину второй стороны."
side2 = gets.to_f

puts "Введите длину третьей стороны."
side3 = gets.to_f

# Находим самую длинную сторону, которая станет Гипотенузой в прямоугольном треугольнике.
a, b, c = [side1, side2, side3].sort

puts "a = #{a}, b = #{b}, c = #{c}"
puts "Вычисляем по формуле a^2 * b^2 = c^2"
puts

# Определяем является ли наш треугольник прямоугольным - т.Пифагора:
if a**2 + b**2 == c**2
  puts "Наш треугольник Прямоугольный!!!)))"
else
  puts "Наш треугольник НЕпрямоугольный((("
end

# Определяем равнобедренный ли треугольник:
if side1 == side2 || side1 == side3 ||side2 == side3
  puts "Наш треугольник равнобедренный!"
end

# Равносторонность:
if side1 == side2 && side1 == side3
  puts "Наш треугольник ко всему прочему ещё и равносторонний!!!"
end


