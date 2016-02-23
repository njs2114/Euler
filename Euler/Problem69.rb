require 'prime'

res = 1
max = 1_000_000

primes = []
Prime.each(200) { |prime| primes << prime }

primes.each do |prime|
  break if (res * prime) >= max
  res *= prime
end

p res
