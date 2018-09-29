#4. Заполнить хеш гласными буквами, где значением будет являтся порядковый номер буквы в алфавите (a - 1).

first_hash = {}

abc = ('a'..'z').to_a

index = 0

for lit in abc
  first_hash[lit] = index + 1
  index += 1
end

#p first_hash

new_arr = first_hash.to_a
#p new_arr

last_arr = []
last_arr.push new_arr[0]
last_arr.push new_arr[4]
last_arr.push new_arr[8]
last_arr.push new_arr[14]
last_arr.push new_arr[20]
last_arr.push new_arr[22]
last_arr.push new_arr[24]
#p last_arr

vowel = last_arr.to_h

p vowel

