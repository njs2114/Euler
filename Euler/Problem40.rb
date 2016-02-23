decimal_count = 1_000_000
decimal = ""
i = 1
loop do
  decimal << i.to_s
  i += 1
  break if decimal.size >= decimal_count
end

product = 1
j = 1
loop do
  product *= decimal[j-1].to_i
  break if j >= decimal_count
  j *= 10
end

p product
