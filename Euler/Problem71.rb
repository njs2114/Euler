require 'time'

time = Time.now

max = 3/7.0
min = max - 0.001

max_part = 1_000_000
min_den = (max_part*0.999).floor
max_num = (max_part*(max)).floor
min_num = (min_den * min).floor

nums = []
dens = []

(min_num...max_num).each do |num|
  max_part.downto(min_den) do |den|
    frac = num/(den+0.0)
    break if frac >= max
    next if frac < min
    nums << num
    dens << den
  end
end

fracs = []
max_frac = 0
max_num = 0
max_den = 0
(0...nums.size).each do |i|
  frac = nums[i]/(dens[i]+0.0)
  if max_frac < frac
    max_frac = frac
    max_num = nums[i]
    max_den = dens[i]
  end
end

p "#{max_frac}: #{max_num}/#{max_den}"
p max_num
p "#{Time.now-time} seconds elapsed"
