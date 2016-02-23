def palindrome?(str)
  str = str.to_s
  return true if str == str.reverse
  return false
end

def double_base_palindrome?(int)
  s_int = int.to_s
  check = palindrome?(s_int)
  b_int = int.to_s(2)
  check = check & palindrome?(b_int)
  return check
end

sum = 0
(0..1_000_000).each do |num|
  if double_base_palindrome?(num)
    sum += num
    p num
  end
end
p sum
