require "prime"
addends = (2..1000000).step(2).to_a
current = 1
count = 1
primes = 0
side_count = 1
ratio = 1.0
addends.each do |addend|
  4.times do
    current += addend
    count += 1
    if Prime.prime?(current)
      primes += 1
    end
  end
  side_count += 2
  ratio = primes/(count+0.0)
  break if ratio < 0.1
end

#p ratio
#p primes
#p count
p side_count
