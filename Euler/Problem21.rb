def factors(num)
  1.upto(Math.sqrt(num)).select {|i| (num % i).zero?}.inject([]) do |f, i|
    f << i
    f << num / i unless i == num / i
    f.sort
  end
end

def sumFactorsOf(num)
  facArray = factors(num)
  facs = facArray.slice(0, facArray.size-1)
  facs.inject(:+)
end

sums = []

(2..10000).each do |origNum|
  sumFacNum = sumFactorsOf(origNum)
  sumFacOfFacNum = sumFactorsOf(sumFactorsOf(origNum))
  if sumFacNum > 1
    if origNum == sumFacOfFacNum
      if origNum != sumFacNum
        sums << sumFacNum
        sums << sumFacOfFacNum
        sums.uniq!
      end
    end
  end
end

p sums.inject(:+)
