require 'prime'
require 'time'

start = Time.now
max = 1000**2 + 1000*1000 + 1000

max_coeffs = []
counts = []
(-70..-60).each do |a| #TODO should be -999 to 999
  (900..999).each do |b| #TODO should be -999 to 999
    count = 0
    (0..80).each do |n| #TODO should be 0 to ?
      break if (Prime.prime?(n**2 + a*n + b) == false)
      count += 1
    end
    if counts.size > 0
      max_coeffs = [a,b] if count > counts.max
    end
    counts << count
  end
end

p counts.max
p max_coeffs
p max_coeffs.inject(:*)
p Time.now - start
