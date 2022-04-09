shopping_list = {}
sum = 0
final_sum = 0

loop do
  puts 'Что добавить в корзину? Введите stop для прекращения добавления'
  item = gets.chomp
  break if item == 'stop'

  puts 'Какая цена у данного продукта?'
  cost = gets.chomp.to_f

  puts 'Какое количество вы взяли?'
  count = gets.chomp.to_f

  sum = cost * count
  shopping_list[item]  = { cost => count }
  final_sum += sum
  puts "Цена за #{item} = #{sum}"
end

puts shopping_list
puts "Обащая сумма в корзине = #{final_sum}"
