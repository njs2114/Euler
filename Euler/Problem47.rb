require "prime.rb"

#test case 2
nums = []
(100000..200000).each do |num|
  factors = []
  Prime.each(num) { |prime| factors << prime if num % prime == 0 }
  nums << num if factors.uniq.size >= 4
end

nums.each { |num| p "#{num}, #{num+1}, #{num+2}, #{num+3}" if nums.include?(num+1) & nums.include?(num+2) & nums.include?(num+3)}
