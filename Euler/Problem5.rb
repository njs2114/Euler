def is_divisible_by_range?(num)
  divisible = true
  (2..20).each do |div|
    divisible = divisible & (num % div == 0)
  end
  return divisible
end

tempVal = 20
loop do
  break if is_divisible_by_range?(tempVal)
  tempVal += 20
end

p tempVal
