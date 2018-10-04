#4. Заполнить хеш гласными буквами, где значением будет являтся порядковый номер буквы в алфавите (a - 1).

vowel = {}
abc = ('a'..'z').to_a
choice = ['a', 'e', 'i', 'o', 'u', 'w', 'y']
index = 0

abc.each_with_index do |letter, index|
  if choice.include?(letter)
    vowel[letter] = index + 1
    index += 1
  end
end

p vowel

