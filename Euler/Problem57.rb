curr_numer = 3
curr_denom = 2
expansion = 1
count = 0

loop do
  break if expansion >= 1000
  last_numer = curr_numer
  last_denom = curr_denom
  curr_denom = last_numer + last_denom
  curr_numer = curr_denom + last_denom
  expansion += 1

  count += 1 if curr_numer.to_s.size > curr_denom.to_s.size
end

p count
