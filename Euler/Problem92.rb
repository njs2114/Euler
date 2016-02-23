require 'time'

def sum_squares(num)
  sum = 0
  num.to_s.split('').each { |val| sum += (val.to_i ** 2) }
  return sum
end

#p sum_squares ARGV[0].to_i

time1 = Time.now

breakers_1 = []
breakers_89 = []

count = 0
(2...10_000_000).each do |num|
  val = num
  loop do
    if val == 1
      break
    end
    if val == 89
      count += 1
      break
    end
    val = sum_squares(val)
  end
end

p "#{Time.now - time1} seconds elapsed"
p count
