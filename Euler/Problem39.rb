def hyp_find(a,b)
  hyp = Math.sqrt(a**2 + b**2)
  return hyp if hyp % 1 == 0
end

def perim_find(a,b,h)
  return a + b + h
end

perims = []
(2..500).each do |a|
  (2..500).each do |b|
    if a <= b
      h = hyp_find(a,b)
      if h != nil
        perim = perim_find(a,b,h)
        #p "Perim: #{perim}: #{a} #{b}" if perim == 840
        if perim <= 1000
          perims << perim
        end
      end
    end
  end
end

perim_hash = {}
perims.each do |perim|
   perim_hash[perim.to_s.to_sym] = perims.count(perim)
end

max_val = 0
max_key = ""
perim_hash.each_pair do |key, val|
  if val > max_val
    max_val = val
    max_key = key
  end
end

p "#{max_key}: #{max_val}"
