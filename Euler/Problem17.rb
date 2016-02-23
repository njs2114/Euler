def itos1(num)
  case num
  when "1"
    return "one"
  when "2"
    return "two"
  when "3"
    return "three"
  when "4"
    return "four"
  when "5"
    return "five"
  when "6"
    return "six"
  when "7"
    return "seven"
  when "8"
    return "eight"
  when "9"
    return "nine"
  else
    return "NaN"
  end
end

def itos2(num)
  val = ""
  case num
  when "10"
    return "ten"
  when "11"
    return "eleven"
  when "12"
    return "twelve"
  when "13"
    return "thirteen"
  when "14"
    return "fourteen"
  when "15"
    return "fifteen"
  when "16"
    return "sixteen"
  when "17"
    return "seventeen"
  when "18"
    return "eighteen"
  when "19"
    return "nineteen"
  else
    case num[0]
    when "2"
      val << "twenty"
    when "3"
      val << "thirty"
    when "4"
      val << "forty"
    when "5"
      val << "fifty"
    when "6"
      val << "sixty"
    when "7"
      val << "seventy"
    when "8"
      val << "eighty"
    when "9"
      val << "ninety"
    end

    if num[1] == "0"
      return val
    else
      return val << " #{itos1(num[1])}"
    end
  end
end

def itos3(num)
  return "#{itos1(num[0])} hundred" if num[1..2] == "00"
  return "#{itos1(num[0])} hundred and #{itos2(num[1..2])}".squeeze(" ")
end

def itos(num)
  s = num.to_s
  if s.size == 1
    return itos1(s)
  elsif s.size == 2
    return itos2(s)
  elsif s.size == 3
    return itos3(s)
  else
    return "one thousand"
  end
end

charsUsed = 0
(1..1000).each do |number|
  value = itos(number)
  #p value
  charsUsed += value.delete(' ').size
end

p charsUsed

#p itos ARGV[0]
