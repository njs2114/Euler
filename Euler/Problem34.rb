def factorial(num)
  prod = 1
  num.downto(2) { |val| prod *= val }
  return prod
end

dig_facs = []
(3..50_000).each do |num|
  sum = 0
  num.to_s.each_char do |char|
    sum += factorial char.to_i
  end
  dig_facs << num if sum == num
end

p dig_facs
