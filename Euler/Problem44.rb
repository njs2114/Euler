def pentagonal_gen(max)
  pens = []
  n = 1
  loop do
    pen = n*(3*n-1)/2
    break if pen >= max
    pens << pen
    n += 1
  end
  return pens
end

pens = pentagonal_gen(10_000_000)

pens.each do |a|
  pens.each do |b|
    diff = (a-b).abs
    sum = a+b
    p diff if pens.include?(sum) & pens.include?(diff)
  end
end
