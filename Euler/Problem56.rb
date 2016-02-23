def sum_digits(num)
  sum = 0
  num.to_s.split('').each { |val| sum += val.to_i }
  return sum
end

max = 0
99.downto(0) do |a|
  99.downto(0) do |b|
    sum = sum_digits(a**b)
    max = [max, sum_digits(a**b)].max
    break if sum < max-100
  end
end

p max
