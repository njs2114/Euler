addends = (2..1000).step(2).to_a
sum = 1
current = 1
addends.each do |addend|
  4.times do
    current += addend
    sum += current
  end
end

p sum
