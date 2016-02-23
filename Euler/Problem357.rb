=begin
require "prime"
require "time"

#find divisors
def div_find(num)
  divs = []
  (1..Math.sqrt(num)).each do |div|
    if num % div == 0
      divs << div
      divs << num/div
    end
  end
  return divs.sort.uniq
end

# only need to check primes up to Math.sqrt(num)
def prime_check?(divs, num, primes)
  divs.each do |div|
    break if div > Math.sqrt(num)
    temp = ((num/div) + div)
    #p "num: #{num}, factos: #{divs} temp: #{temp}"
    return false if primes.include?(temp) == false
  end
  return true
end

#num = ARGV[0].to_i
#p div_find(num)
#p prime_check?(div_find(num),num)

time = Time.now

max = 100_000
primes = [1]
Prime.each(max+1) { |prime| primes << prime }
#p primes
sum = 0
(1..max).each do |num|
  if prime_check?(div_find(num), num, primes)
    sum += num
  end
end
p sum
p "#{Time.now-time} seconds elapsed"
=end

require 'prime'

class Integer
    # Make a lazy enumerator of the lower half of factors of self
    def half_factors
        (1..Math.sqrt(self) + 1).lazy.select { |n| (self % n).zero? }
    end
end

counter = 0

max = 100_000_000

primes = Array.new(max+1) { |i| false }
Prime.each do |prime|
    break if prime > max
    primes[prime] = true

    n = prime - 1
    half_factors = n.half_factors
    counter += n if half_factors.all? { |d| primes[d + n/d] }
end

p counter
