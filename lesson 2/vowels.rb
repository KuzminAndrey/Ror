# Заполнить хеш гласными буквами, где значением будет являтся порядковый номер буквы в алфавите (a - 1).

letters = ("a".."z").to_a
vowels = ["a", "e", "i", "o", "u", "y"]
hash = {}

letters.each_with_index do | letter, index |
  hash[letter] = index + 1 if vowels.include?(letter)
end

p hash
