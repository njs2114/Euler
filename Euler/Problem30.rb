nums = []
power = 5
(2..200_000).each do |num|
  num_sum = 0
  s_num = num.to_s
  s_num.each_char do |char|
    num_sum += char.to_i**power
  end
  nums << num if num_sum == num
end

p nums.inject(:+)
