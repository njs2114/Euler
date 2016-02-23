count = 0
(1..99).each do |num|
  (0..99).each do |pow|
    prod = num ** pow
    count += 1 if pow == prod.to_s.size
  end
end

p count
