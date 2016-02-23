combos = []
(2..100).each do |a|
  (2..100).each do |b|
    combos << a**b
  end
end
combos = combos.uniq
p combos.size
