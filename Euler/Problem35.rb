require "prime.rb"

circles = []
(1..1_000_000).each do |num|
  prime_check = Prime.prime?(num)
  next if prime_check == false
  split_num = num.to_s.split("")
  split_num.size.times do
    split_num.push split_num.shift
    prime_check = (prime_check) & (Prime.prime?(split_num.join.to_i))
  end
  circles << num if prime_check == true
end

p circles
p circles.size
