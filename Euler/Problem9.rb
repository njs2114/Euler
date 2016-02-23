def pythagorean(a,b,c)
  (a**2 + b**2) == c**2
end

maxVal = 1000
breakCheck = false

(1..maxVal/2).each do |aVal|
  (1..maxVal/2).each do |bVal|
    cVal = maxVal - bVal - aVal
    if pythagorean aVal, bVal, cVal
      puts "#{aVal} * #{bVal} * #{cVal} = #{aVal*bVal*cVal}"
      breakCheck = true
    end
    break if breakCheck
  end
  break if breakCheck
end
