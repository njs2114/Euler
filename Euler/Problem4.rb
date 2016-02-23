def palindrome?(str)
  str = str.to_s
  return true if str == str.reverse
  return false
end

#p palindrome? ARGV[0]

num1 = 999
num2 = 999
max_prod = 0

(num2-100..num2).each do |var2|
  (num1-100..num1).each do |var1|
    prod = var1*var2
    if palindrome? prod
      if max_prod < prod
        max_prod = prod
      end
    end
  end
end

p max_prod
