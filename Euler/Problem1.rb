var1, var2 = 3, 5
max = 1000
sum = 0

(0...max).each do |num|
  if num % 3 == 0 || num % 5 == 0
    sum += num
  end
end
p sum
