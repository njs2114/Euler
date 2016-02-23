require "prime.rb"

sub_primes = []
Prime.each(1000) { |prime| sub_primes << prime }

all_primes = []
Prime.each(9999) { |prime| all_primes << prime }

primes = all_primes - sub_primes

sequences = []
primes.each do |prime|
  perms = []
  prime.to_s.split('').permutation do |perm|
    temp_perm = perm.join.to_i
    perms << temp_perm if primes.include?(temp_perm)
    perms.uniq!
  end
  sequences << perms.sort if perms.size >= 3
end

tripplets = []
sequences.each do |seq|
  (0...seq.size).each { |i| tripplets << seq[i..i+2] if seq[i+2] != nil }
  tripplets.uniq!
end

s_trip = ""
tripplets.each do |trip|
  if (trip[2]-trip[1]) == (trip[1]-trip[0])
    s_trip = trip[0].to_s + trip[1].to_s + trip[2].to_s
  end
end

p s_trip
