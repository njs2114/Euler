require "prime.rb"

def truncRPrime?(num)
  prime_check = true
  s_num = num.to_s
  (s_num.size-1).times do
    s_num = s_num[0..-2]
    prime_check = prime_check & Prime.prime?(s_num.to_i)
    break if prime_check == false
  end
  return prime_check
end

def truncLPrime?(num)
  prime_check = true
  s_num = num.to_s
  (s_num.size-1).times do
    s_num = s_num[1..-1]
    prime_check = prime_check & Prime.prime?(s_num.to_i)
    break if prime_check == false
  end
  return prime_check
end

def truncPrime?(num)
  return false if num.to_s.size == 1
  return truncLPrime?(num) & truncRPrime?(num)
end

sum = 0
Prime.each(1_000_000) { |num| sum += num if truncPrime?(num) }
p sum
