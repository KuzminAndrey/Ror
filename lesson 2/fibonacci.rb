# Заполнить массив числами фибоначчи до 100
array = [0,1]
k = 1

while array[-1] + array[-2] < 100
  array << array[k]+array[k-1]
  k += 1
end

p array
