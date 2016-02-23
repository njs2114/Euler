def palindrome?(str)
  str = str.to_s
  return true if str == str.reverse
  return false
end

def flip_sum(num)
  return num + num.to_s.reverse.to_i
end

lychrel_count = 0

(1..9999).each do |num|
  count = 0
  pal = num
  loop do
    break if count > 50
    pal = flip_sum(pal)
    break if palindrome?(pal)
    count += 1
  end
  #p "#{num} took #{count} flip-adds to form the palindrome #{pal}" if count <= 50
  #p "#{num} couldn't be formed into a palindrome with #{count} flip-adds" if count > 50
  lychrel_count += 1 if count > 50
end

puts lychrel_count
