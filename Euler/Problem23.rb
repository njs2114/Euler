def factors(num)
  1.upto(Math.sqrt(num)).select {|i| (num % i).zero?}.inject([]) do |f, i|
    f << i
    f << num / i unless i == num / i
    f.sort
  end
end

def sumFactorsOf(num)
  facArray = factors(num)
  return 0 if facArray.size == 1
  facs = facArray.slice(0, facArray.size-1)
  facs.inject(:+)
end

def perfect?(num, sum)
  return true if num == sum
end

def abundant?(num, sum)
  return true if num < sum
end

def deficient?(num, sum)
  return true if num > sum
end

# get array of abundant numbers
abundantNums = []
(12..28123).each { |val| abundantNums << val if abundant?(val, sumFactorsOf(val))}

sum = 0
(1..23).each { |val| sum += val}

(25..28123).each do |val|
  #p sum if val % 1000 == 0
  abundantNums.each do |aNum|
    if (val - aNum) < 12 # ran out of aNums to check
      sum += val
      break
    elsif abundantNums.include?(val - aNum) # sum of abundants, next num
      break
    end
  end
end

p sum
