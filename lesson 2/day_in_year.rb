months_array = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

puts "Enter current year:"
year = gets.chomp.to_i
puts "Enter number of current month:"
month = gets.chomp.to_i
puts "Enter current day:"
day = gets.chomp.to_i

leap =
  if year % 4 == 0 && year %100 != 0
    true
  elsif year % 400 == 0
    true
  else
    false
  end

if leap
  puts "Year #{year} is leap"
  months_array[1] = 29
else
  puts "Year #{year} is not leap"
end

day_count = day
x = month - 1 #указатель на месяц в массиве

while x > 0
  day_count += months_array[x]
  x -= 1
end
puts "Days form the beginning of the year #{day_count}"
