require "prime.rb"

breakCheck = false
num = "123456789"
panPrimes = []

(1..6).each do |sub|
  perms = num.split('').permutation.to_a
  perms.each do |val|
    if Prime.prime?(val.join.to_i)
      panPrimes << val.join.to_i
      breakCheck = true
    end
  end
  num = num[0..-2]
  break if breakCheck
end

p panPrimes.max

=begin
def pandigital?(num)
  a_num = num.to_s.split('').sort
  retVal = (a_num == a_num.uniq)
  index = 1
  a_num.each do |num|
    retVal = retVal & (num.to_i == index)
    index += 1
  end
  return retVal
end

def pandigital_prime?(num)
  if Prime.prime?(num)
    pandigital?(num)
  end
end

panPrimes = []
Prime.each(1_000_000_000) do |num|
  panPrimes << num if pandigital?(num)
end

p panPrimes.max
=end
