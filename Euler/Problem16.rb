sum = 0
((2**1000).to_s).each_char { |char| sum += char.to_i }
p sum
