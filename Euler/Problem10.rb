require 'prime.rb'

primeSum = 0

Prime.each(2_000_000) do |prime|
  primeSum += prime
end

p primeSum
