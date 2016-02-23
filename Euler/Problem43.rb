num = "0123456789"

def div_check?(num, index)
  return (num % 2 == 0) if index == 1
  return (num % 3 == 0) if index == 2
  return (num % 5 == 0) if index == 3
  return (num % 7 == 0) if index == 4
  return (num % 11 == 0) if index == 5
  return (num % 13 == 0) if index == 6
  return (num % 17 == 0) if index == 7
end

divisors = []
perms = num.split('').permutation.to_a
perms.each do |perm| # each permutation
  val = perm.join
  subs_divisible = true
  (1..7).each do |start| # 2nd digit, to 8th digit
    divisor = val[start..start+2].to_i
    subs_divisible = subs_divisible & div_check?(divisor, start)
    break if subs_divisible == false
  end
  divisors << val.to_i if subs_divisible == true
end

p divisors.inject(:+)
