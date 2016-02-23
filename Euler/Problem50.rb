require 'prime'

primes = []
sum = 0
count = 0
Prime.each(1_000_000) do |prime|
  sum += prime
  break if sum > 1_000_000
  count += 1
  primes << prime
end
count.downto 21 do |n|
  for i in 0..primes.size - n
    sum = primes[i,n].inject(:+)
    break if sum > 1_000_000
    if Prime.prime? sum
      puts "Sum #{sum} has #{n} consecutive prime terms"
      break
    end
  end
  break if Prime.prime? sum
end

=begin my code
primes = []
Prime.each(1_000_000) { |prime| primes << prime }
#p primes

prime_sums = {}
primes = primes[3..primes.size]
p_sum = 0
count = 1
primes.each do |prime|
  p_sum += prime
  prime_sums[p_sum.to_s.to_sym] = count if Prime.prime?(p_sum)
  count += 1
end

max_val = 0
max_key = 0
prime_sums.each do |key, val|
  if key.to_s.to_i < 1_000_000
    if val > max_val
      max_val = val
      max_key = key.to_s.to_i
    end
  end
end

p "Sum #{max_key} has #{max_val} consecutive terms"
=end
