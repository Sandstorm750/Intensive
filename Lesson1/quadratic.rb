
# Решение квадратного уравнения: #ax^2 + bx + c = 0

puts "Укажите значение a"
a = gets.to_f

puts "Укажите значение b"
b = gets.to_f

puts "Укажите значение c"
c = gets.to_f
puts

if a == 0
  puts "Решение не возможно!"
  exit
end

d = (b**2)-(4*a*c)
  puts "Дискриминант равен #{d}"

if d < 0
  puts "d < 0 - Корней нет, а значит нет решения"
  exit

elsif d == 0

  x = -b /(2*a)
  puts "В уравнении только один корень x = #{x}"

else d > 0

  e = Math.sqrt(d)
  
  x1 = (-b + e)/(2*a)
  x2 = (-b - e)/(2*a)
  puts "В уравнении два корня: x1 = #{x1} и x2 = #{x2}"
end

