def cOp(num)
  if num%2 == 0
    return num/2
  else
    return num*3 + 1
  end
end

cHash = {:"1" => 1}
val = 1
maxChain = 0
maxStart = 0

loop do # counting up
  tempVal = val
  tempChain = 0
  loop do # chaining down
    if cHash.include?(tempVal.to_s.to_sym)
      sumChain = tempChain + cHash[tempVal.to_s.to_sym]
      if maxChain < sumChain
        maxChain = sumChain
        maxStart = val
      end
      cHash[val.to_s.to_sym] = sumChain
      break
    else
      tempChain += 1
      tempVal = cOp tempVal
    end
  end # end chaining down
  val += 1
  break if val >= 1_000_000
end # end counting up

p "Start #{maxStart} has a chain of #{maxChain} operations."
#max = cHash.values.max
#p cHash.select{|key, val| val == max }
