sum = 0
factorial = (1..ARGV[0].to_i).inject(:*).to_s
factorial.each_char { |char| sum += char.to_i}
p sum
