sum = 0
(1..1000).each { |i| sum += i**i }

p sum.to_s[-10..-1]
