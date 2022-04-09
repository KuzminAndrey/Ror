# Заполнить хеш гласными буквами, где значением будет являтся порядковый номер буквы в алфавите (a - 1).

letters = ("a".."z").to_a
hash = Hash.new
i = 1
letters.each do |letter|
    hash[letter] = i
    i += 1
end

vowels = ["a", "e", "i", "o", "u", "y"]
vowels_hash = Hash.new
hash.each do |letter, number|
    vowels_hash[letter] = number if vowels.include?(letter)
end

p vowels_hash
