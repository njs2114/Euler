target = ARGV[0].to_i
target = 100 if target == 0
ways = Array.new(target+1,0)
ways[0] = 1

(1..(target-1)).each do |i|
  (i..target).each do |j|
    ways[j] += ways[j-i]
  end
end

p ways.max
