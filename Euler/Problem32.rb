def pandigital?(num)
  a_num = num.to_s.split('').sort
  retVal = (a_num == a_num.uniq)
  index = 1
  a_num.each do |num|
    retVal = retVal & (num.to_i == index)
    index += 1
  end
  return retVal
end

def size_check(a,b,c)
  (a.to_s.size + b.to_s.size + c.to_s.size) == 9
end

def pan_merge?(a,b,c)
  pandigital?((a.to_s + b.to_s + c.to_s).to_i)
end

pan_prods = []
(1..50).each do |a|
  (1..2000).each do |b|
    if a < b
      c = a*b
      if size_check(a,b,c)
        pan_prods << c if pan_merge?(a,b,c)
      end
    end
  end
end
p pan_prods.uniq.sort
p pan_prods.uniq.inject(:+)
